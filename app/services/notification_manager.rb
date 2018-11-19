# frozen_string_literal: true

class NotificationManager < ApplicationService
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def send_next_notification
    trace('send_next_notification', game: game.name) do
      Time.use_zone(game.timezone) do
        send_next_notification_localtime
      end
    end
  end

  private

  traced_method def send_next_notification_localtime
    notify_final_game_status ||
      notify_early_game_status ||
      notify_game_day
  end

  traced_method def notify_final_game_status
    notify_if_time_arrived :game_status, game.email_time do
      if game.on?
        mailer.game_on(game).deliver
      elsif game.need_more?
        mailer.game_off(game).deliver
      end
    end
  end

  traced_method def notify_early_game_status
    notify_if_time_arrived :need_more, game.early_email_time do
      mailer.need_more(game).deliver if game.need_more?
    end
  end

  traced_method def notify_game_day
    notify_if_time_arrived :game_day, game.game_day_time do
      mailer.game_day(game).deliver if game.game_day?
    end
  end

  traced_method def notify_if_time_arrived(what, notify_at)
    # If no notify time, it means this game is not configured for these
    # notifications, so consider it as sent
    return true unless notify_at.present?

    notify_time = Time.zone.parse(notify_at)
    now = Time.zone.now

    if now >= notify_time
      trace('Time arrived for notification',
        game: game.name, what: what, notify_at: notify_at,
        notify_time: notify_time, now: now
      )
      if already_sent_notification what, notify_time
        trace('Already sent notification',
          game: game.name, what: what, notify_at: notify_at,
          notify_time: notify_time, now: now
        )
      else
        sent = trace('Time arrived for notification email',
          game: game.name, what: what, notify_at: notify_at,
          notify_time: notify_time, now: now
        ) do |trace_tags|
          sent = yield
          trace_tags[:sent] = sent
        end
        notification_for(what).update sent_at: now if sent
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
    Notification.find_or_create_by(game: game, what: what)
  end

  def mailer
    @mailer ||= NotificationMailer.new
  end
end
