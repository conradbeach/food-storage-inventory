# frozen_string_literal: true

module FoodItemsHelper
  def format_units(units, unit_type)
    unit_type = "units" if unit_type == "quantity"

    displayed_unit_type = (units == 1 ? unit_type.singularize : unit_type)

    if unit_type == "pounds" && units < 4 && !whole_number?(units)
      displayed_unit_type = "ounces"
      units = (units * 16)
    end

    "#{round(units)} #{displayed_unit_type}"
  end

  private

  def whole_number?(number)
    (number % 1).zero?
  end

  def round(number)
    whole_number?(number) ? number.to_i : number.round(2)
  end
end
