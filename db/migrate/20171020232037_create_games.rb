class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|

      t.timestamps

      t.string :name, unique: true
      t.string :brief
      t.text :description
      t.text :location

      t.string :game_days
      t.string :game_day_time
      t.string :game_time
      t.string :signup_time
      t.string :email_time
      t.string :early_email_time

      t.integer :min_team_size, default: 3

      t.integer :status, default: 0

      t.string :notify_address
      t.string :subscribe_url
      t.string :unsubscribe_url
    end
  end
end
