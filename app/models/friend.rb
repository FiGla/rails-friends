# frozen_string_literal: true

class Friend < ApplicationRecord
  belongs_to :user
  has_many :children, dependent: :destroy
  validates :first_name, :last_name, presence: true

  def name
    "#{first_name} #{last_name}"
  end
end
