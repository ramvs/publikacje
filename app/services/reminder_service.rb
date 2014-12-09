class ReminderService
  def self.call
    User.find_each do |user|
      ReminderMailer.reminder_mail(user).deliver
    end
  end
end