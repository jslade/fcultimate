# frozen_string_literal: true

class NotificationManager
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def send_next_notification
    Time.use_zone(game.timezone) do
      send_next_notification_localtime
    end
  end

  private

  def send_next_notification_localtime
    notify_final_game_status ||
      notify_early_game_status ||
      notify_game_day
  end

  def notify_final_game_status
    notify_if_time_arrived :game_status, game.email_time do
      mailer.game_on(game)&.deliver if game.on?
      mailer.game_off(game)&.deliver if game.need_more?
    end
  end

  def notify_early_game_status
    notify_if_time_arrived :need_more, game.early_email_time do
      mailer.need_more(game)&.deliver if game.need_more?
    end
  end

  def notify_game_day
    notify_if_time_arrived :game_day, game.game_day_time do
      mailer.game_day(game)&.deliver if game.game_day?
    end
  end

  def notify_if_time_arrived(what, notify_time)
    # If no notify time, it means this game is not configured for these
    # notifications, so consider it as sent
    return true unless notify_time.present?

    now = Time.zone.now
    if now >= notify_time.to_time
      unless already_sent_notification what, notify_time
        yield
        notification_for(what).update sent_at: now
      end
      return true
    end

    false
  end

  def already_sent_notification(what, notify_time)
    notification = notification_for(what)
    notification.sent_at && notification.sent_at >= notify_time
  end

  def notification_for(what)
    Notification.find_by(game: game, what: what) ||
      Notification.create(game: game, what: what)
  end

  def mailer
    @mailer ||= NotificationMailer.new
  end
end
