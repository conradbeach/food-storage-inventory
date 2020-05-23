# frozen_string_literal: true

require "rails_helper"

RSpec.describe "food_items/edit", type: :view do
  before do
    @food_item = assign(:food_item, FoodItem.create!(
                                      category: nil,
                                      name: "MyString",
                                      weight: 1.5,
                                    ))
  end

  it "renders the edit food_item form" do
    render

    assert_select "form[action=?][method=?]", food_item_path(@food_item), "post" do
      assert_select "input[name=?]", "food_item[category_id]"

      assert_select "input[name=?]", "food_item[name]"

      assert_select "input[name=?]", "food_item[weight]"
    end
  end
end
