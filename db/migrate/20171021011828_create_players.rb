class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|

      t.timestamps

      t.bigint :game_id, null: false

      t.string :name, null: false
    end

    add_foreign_key :players, :games
  end
end
