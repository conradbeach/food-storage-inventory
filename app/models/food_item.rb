class FoodItem < ApplicationRecord
  belongs_to :category

  validates_presence_of :name, :expiration_date, :units
end
