class AlterNotificationsSentAt < ActiveRecord::Migration[5.1]
  def change
    change_column :notifications, :sent_at, :timestamp
  end
end
