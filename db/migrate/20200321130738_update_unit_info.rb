# frozen_string_literal: true

class UpdateUnitInfo < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :unit_type, :integer
    add_column :categories, :units_per_year_per_adult, :float

    remove_column :food_items, :weight, :float
    add_column :food_items, :units, :float
  end
end
