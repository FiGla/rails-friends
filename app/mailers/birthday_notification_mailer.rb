# frozen_string_literal: true

require 'dotiw'

class BirthdayNotificationMailer < ApplicationMailer
  include ActionView::Helpers::DateHelper

  def birthday_notification_email
    @user = params[:user]
    @friend = params[:friend]

    mail(to: @user.email, subject: "Your friend's birthday is today!")
  end

  def reminder_birthday_notification_email
    @user = params[:user]
    @friend = params[:friend]

    mail(to: @user.email, subject: "Your friend's birthday is next Week!")
  end
end
