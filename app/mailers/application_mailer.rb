# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@rails-friends.com'
  layout 'mailer'
end
