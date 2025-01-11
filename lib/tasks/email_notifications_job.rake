namespace :email_notifications do
  desc "Run EmailNotificationJob"
  task birthday_reminder: :environment do
    EmailNotificationJob.perform_later
  end
end