class ReminderMailer < ActionMailer::Base
  default from: 'publikacje.kia@gmail.com'

  def reminder_mail(user)
    @user = user
    if @user.reminder.present?
        mail(to: @user.email, subject: 'KIA - Przypomnienie')
    end
  end
end
