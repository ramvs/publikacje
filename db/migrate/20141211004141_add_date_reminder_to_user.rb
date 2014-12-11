class AddDateReminderToUser < ActiveRecord::Migration
  def change
    add_column :users, :date_reminder, :date
  end
end
