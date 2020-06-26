# frozen_string_literal: true

require "rails_helper"

RSpec.describe "food_items/index", type: :view do
  before do
    assign(:food_items, [
             FoodItem.create!(
               category: nil,
               name: "Name",
               weight: 2.5,
             ),
             FoodItem.create!(
               category: nil,
               name: "Name",
               weight: 2.5,
             ),
           ])
  end

  xit "renders a list of food_items" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.5.to_s, count: 2
  end
end
