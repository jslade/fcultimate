class AddTimezoneToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :timezone, :string
  end
end
