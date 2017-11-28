# frozen_string_literal: true

class SignupManager
  attr_reader :game

  def initialize(game)
    @game = game
  end

  def add_player(player_name, team_size, options = {})
    player_name.strip!
    return nil unless player_name.present?

    player = find_player_by_name(player_name, options)
    signup = create_or_update_signup(player, team_size, options)

    update_status unless options[:update_status] == false

    signup
  end

  def remove_player(signup, options = {})
    signup.delete

    update_status unless options[:update_status] == false
  end

  def update_status
    purge_old_signups

    if game.signups.empty?
      curr_team_size = 0
      new_status = game.game_day? ? Game::NOBODY : Game::NOT_GAME_DAY
    else
      curr_team_size = find_curr_team_size
      new_status = new_status_for(curr_team_size)
    end

    game.update status: new_status, curr_team_size: curr_team_size
  end

  def purge_old_signups
    Signup.where('updated_at < ?', Date.today).delete_all
  end

  private

  def find_player_by_name(player_name, _options)
    Player.find_by(name: player_name, game_id: game.id) ||
      Player.create(name: player_name, game: game)
  end

  def create_or_update_signup(player, team_size, options)
    signup = Signup.find_by(player_id: player.id, game_id: game.id)
    unless signup
      signup = Signup.create(player: player, game: game)
      game.signups << signup
    end

    attrs = {
      team_size: team_size,
      comment: options[:comment]
    }
    signup.update attrs

    signup
  end

  def find_curr_team_size
    bucketize_signups.each_with_index.map do |count, team_size|
      count >= team_size * 2 ? team_size : 0
    end.max
  end

  def bucketize_signups
    buckets = [].fill(0, 0, game.max_team_size + 1)
    (game.min_team_size..game.max_team_size).each do |team_size|
      game.signups.each do |su|
        buckets[team_size] += 1 if su.willing_to_play?(team_size)
      end
    end
    buckets
  end

  def new_status_for(curr_team_size)
    if curr_team_size < game.min_team_size
      Game::TOO_FEW
    elsif game.signups.size > game.max_team_size * 2
      Game::EXTRA
    else
      Game::ENOUGH
    end
  end
end
