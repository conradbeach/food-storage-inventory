class Category < ApplicationRecord
  belongs_to :storage_type
  has_many :food_items

  enum unit_type: [:pounds, :servings, :quantity]

  delegate :user, to: :storage_type

  validates_presence_of :name, :unit_type, :units_per_year_per_adult

  def total_units
    food_items.sum(:units)
  end

  def number_of_years_provided_for
    return 0 if user.adults_providing_for.blank? || user.adults_providing_for.zero?

    total_units / units_per_year_per_adult / user.adults_providing_for
  end
end
