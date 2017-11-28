# frozen_string_literal: true

class NotificationMailer < ApplicationMailer
  helper :game
  include GameHelper

  def game_day(game)
    init_mail(game, 'Today is game day')
  end

  def need_more(game)
    init_mail(game, "Need more: #{players(game)} so far")
  end

  def game_on(game)
    init_mail(game, "Game on! #{players(game)}")
  end

  def game_off(game)
    init_mail(game, "No goho... Only #{players(game)}")
  end

  private

  def init_mail(game, subj)
    @game = game

    # Workaround -- action_name is evaluating to nil for some reason,
    # so provide an explicit template_name instead
    template_name = caller(1..1).first[/`.*'/][1..-2]

    mail(to: game.notify_address, subject: subj, template_name: template_name)
  end
end
