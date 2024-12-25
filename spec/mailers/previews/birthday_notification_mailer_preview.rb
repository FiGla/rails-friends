# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/birthday_notification_mailer
class BirthdayNotificationMailerPreview < ActionMailer::Preview
  def birthday_notification_email
    BirthdayNotificationMailer.with(user: User.first, friend: Friend.first).birthday_notification_email
  end

  def reminder_birthday_notification_email
    BirthdayNotificationMailer.with(user: User.first, friend: Friend.first).reminder_birthday_notification_email
  end
end
