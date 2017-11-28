class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.bigint :game_id, null: false
      t.string :what, null: false
      t.string :sent_at
      t.timestamps
    end
  end
end
