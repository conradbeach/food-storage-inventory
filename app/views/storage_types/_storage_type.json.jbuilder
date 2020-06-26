# frozen_string_literal: true

json.extract! storage_type, :id, :user_id, :name, :created_at, :updated_at
json.url storage_type_url(storage_type, format: :json)
