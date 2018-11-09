RSpec.describe NotificationManager, type: :service do
  let(:game) do
    create :game,
           notify_address: 'dummy@example.com',
           game_day_time: '00:00',
           early_email_time: '10:00',
           email_time: '11:00'
  end
  let(:signup_mgr) { SignupManager.new(game) }
  let(:notify_mgr) { NotificationManager.new(game) }

  def do_notify
    signup_mgr.update_status
    notify_mgr.send_next_notification
  end

  def expect_email(subject_pattern)
    expect_any_instance_of(NotificationMailer)
      .to receive(:mail)
      .with(hash_including(subject: subject_pattern))
      .and_call_original
  end

  def expect_no_email
    expect_any_instance_of(NotificationMailer).to_not receive(:mail)
  end

  def expect_notification(what)
    now = Time.zone.now
    yield
    n = Notification.find_by!(game_id: game.id, what: what)
    expect(n.sent_at.present? && n.sent_at >= now).to be_truthy
  end

  def expect_no_notification(what)
    now = Time.zone.now
    yield
    n = Notification.find_by(game_id: game.id, what: what)
    expect(n.nil? || n.sent_at.nil? || n.sent_at < now).to be_truthy
  end

  describe 'send_next_notification' do
    context 'today is gameday' do
      before do
        allow(game).to receive(:game_day?) { true }
      end

      it 'sends once' do
        expect_email(/game day/)
        Timecop.freeze('9:00'.to_time) do
          expect_notification(:game_day) { do_notify }
        end
        Timecop.freeze('9:30'.to_time) do
          expect_no_notification(:game_day) { do_notify }
        end
      end
    end

    context 'today is not gameday' do
      before do
        allow(game).to receive(:game_day?) { false }
      end

      it 'does not send' do
        expect_no_email
        Timecop.freeze('9:00'.to_time) do
          expect_no_notification(:game_day) { do_notify }
        end
      end
    end

    context 'nobody signed up' do
      it 'does not send' do
        expect_no_email
        do_notify
      end
    end

    context 'too few signed up' do
      before do
        5.times { |i| signup_mgr.add_player "p#{i}", 3 }
      end

      it 'sends early email once' do
        expect_email(/Need more/)
        Timecop.freeze('10:00'.to_time) do
          expect_notification(:need_more) { do_notify }
        end
        Timecop.freeze('10:30'.to_time) do
          expect_no_notification(:need_more) { do_notify }
        end
      end

      it 'sends final email once' do
        expect_email(/No goho/)
        Timecop.freeze('11:00'.to_time) do
          expect_notification(:game_status) { do_notify }
        end
        Timecop.freeze('11:30'.to_time) do
          expect_no_notification(:gate_status) { do_notify }
        end
      end
    end

    context 'enough signed up' do
      before do
        6.times { |i| signup_mgr.add_player "p#{i}", 3 }
      end

      it 'does not send early email' do
        expect_no_email
        Timecop.freeze('10:00'.to_time) { do_notify }
      end

      it 'sends final email once' do
        expect_email(/Game on/)
        Timecop.freeze('11:00'.to_time) do
          expect_notification(:game_status) { do_notify }
        end
        Timecop.freeze('11:30'.to_time) do
          expect_no_notification(:game_status) { do_notify }
        end
      end

      context 'notification already there' do
        before do
          Notification.create game: game, what: :game_status, sent_at: 24.hours.ago
        end

        it 'sends final email once' do
          expect_email(/Game on/)
          Timecop.freeze('11:00'.to_time) do
            expect_notification(:game_status) { do_notify }
          end
          Timecop.freeze('11:30'.to_time) do
            expect_no_notification(:game_status) { do_notify }
          end
        end
      end
    end
  end
end
