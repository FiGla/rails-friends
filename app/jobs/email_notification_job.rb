# frozen_string_literal: true

class EmailNotificationJob < ApplicationJob
  queue_as :default

  def perform
    Rails.logger.info "Running EmailNotificationJob at #{Time.now}"
    Friend.where('extract(month from birthday) = ? AND extract(day from birthday) = ?', Date.today.month, Date.today.day).each do |friend|
      BirthdayNotificationMailer.birthday_notification_email(friend).deliver_later
      Rails.logger.info "Email sent to #{friend.name}"
    end

    Friend.where('extract(month from birthday) = ? AND extract(day from birthday) = ?', (Date.today + 7.days).month, (Date.today + 7.days).day).each do |friend|
      BirthdayNotificationMailer.reminder_birthday_notification_email(friend).deliver_later
      Rails.logger.info "Email sent to #{friend.name}"
    end

    Child.where('extract(month from date_of_birth) = ? AND extract(day from date_of_birth) = ?', Date.today.month, Date.today.day).each do |child|
      BirthdayNotificationMailer.child_birthday_notification_email(child).deliver_later
      Rails.logger.info "Email sent for child #{child.name}"
    end
    Rails.logger.info "EmailNotificationJob completed at #{Time.now}"
  end
end
