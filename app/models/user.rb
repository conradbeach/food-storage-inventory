# frozen_string_literal: true

class User < ApplicationRecord
  include Clearance::User

  has_many :storage_types, dependent: :restrict_with_exception
  has_many :categories, through: :storage_types
  has_many :food_items, through: :categories
end
