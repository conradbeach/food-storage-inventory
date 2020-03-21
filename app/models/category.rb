class Category < ApplicationRecord
  belongs_to :storage_type
  has_many :food_items

  enum unit_type: [:pounds, :servings, :quantity]

  validates_presence_of :name, :unit_type, :units_per_year_per_adult
end
