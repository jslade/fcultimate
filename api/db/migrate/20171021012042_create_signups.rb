class CreateSignups < ActiveRecord::Migration[5.1]
  def change
    create_table :signups do |t|

      t.timestamps

      t.bigint :player_id, null: false
      t.bigint :game_id, null: false

      t.integer :team_size, default: 4
      t.text :comment
    end

    add_foreign_key :signups, :games
    add_foreign_key :signups, :players
  end
end
