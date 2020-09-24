# frozen_string_literal: true

class FoodItem < ApplicationRecord
  belongs_to :category

  validates :name, :expiration_date, :units, presence: true

  delegate :storage_type, to: :category
end
