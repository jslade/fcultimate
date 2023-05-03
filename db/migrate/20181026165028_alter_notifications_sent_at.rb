class AlterNotificationsSentAt < ActiveRecord::Migration[5.1]
  def change
    remove_column :notifications, :sent_at
    add_column :notifications, :sent_at, 'timestamp with time zone'
  end
end
