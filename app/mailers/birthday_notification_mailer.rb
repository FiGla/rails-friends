# frozen_string_literal: true

require 'dotiw'

class BirthdayNotificationMailer < ApplicationMailer
  include ActionView::Helpers::DateHelper

  def birthday_notification_email(friend)
    @friend = friend
    @user = friend.user
    mail(to: @user.email, subject: "Your friend's birthday is today!")
  end

  def reminder_birthday_notification_email(friend)
    @friend = friend
    @user = friend.user
    mail(to: @user.email, subject: "Your friend's birthday is next Week!")
  end

  def child_birthday_notification_email(child)
    @child = child
    @user = child.friend.user
    mail(to: @user.email, subject: "Your friend's child birthday is today!")
  end
end
