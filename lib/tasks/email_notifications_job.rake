# frozen_string_literal: true

namespace :email_notifications do
  desc 'Run EmailNotificationJob'
  task birthday_reminder: :environment do
    EmailNotificationJob.perform_now
  end
end
