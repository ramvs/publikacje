class AddDateReminderLastToUsers < ActiveRecord::Migration
  def change
    add_column :users, :date_reminder_last, :date
  end
end
