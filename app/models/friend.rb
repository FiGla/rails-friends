# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, presence: true
end
