# frozen_string_literal: true

json.array! @food_items, partial: "food_items/food_item", as: :food_item
