# frozen_string_literal: true

class UpdateUnitInfo < ActiveRecord::Migration[6.0]
  def change
    change_table :categories, bulk: true do |t|
      t.column :unit_type, :integer
      t.column :units_per_year_per_adult, :float
    end

    change_table :food_items, bulk: true do |t|
      t.column :units, :float
    end

    remove_column :food_items, :weight, :float
  end
end
