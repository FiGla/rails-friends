# frozen_string_literal: true

json.extract! child, :id, :name, :date_of_birth, :friend_id, :created_at, :updated_at
json.url child_url(child, format: :json)
