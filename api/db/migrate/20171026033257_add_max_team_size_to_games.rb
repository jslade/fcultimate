class AddMaxTeamSizeToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :max_team_size, :integer, default: 7
    add_column :games, :curr_team_size, :integer, default: 0
  end
end
