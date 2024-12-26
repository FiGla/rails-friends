# frozen_string_literal: true

class Child < ApplicationRecord
  belongs_to :friend

  validates :name, :date_of_birth, presence: true

  def age
    now = Time.now.utc.to_date
    now.year - date_of_birth.year - (date_of_birth.to_date.change(year: now.year) > now ? 1 : 0)
  end
end
