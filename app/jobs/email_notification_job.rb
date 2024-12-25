# frozen_string_literal: true

class EmailNotificationJob < ApplicationJob
  queue_as :default

  def perform
    Friend.where('extract(month from birthday) = ? AND extract(day from birthday) = ?', Date.today.month, Date.today.day).each do |friend|
      BirthdayNotificationMailer.birthday_notification_email(friend).deliver_later
    end

    Friend.where('extract(month from birthday) = ? AND extract(day from birthday) = ?', (Date.today + 7.days).month, (Date.today + 7.days).day).each do |friend|
      BirthdayNotificationMailer.reminder_birthday_notification_email(friend).deliver_later
    end
  end
end
