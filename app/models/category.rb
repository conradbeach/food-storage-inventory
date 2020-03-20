class Category < ApplicationRecord
  belongs_to :storage_type
  has_many :food_items
end
