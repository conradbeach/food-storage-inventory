# frozen_string_literal: true

require "rails_helper"

RSpec.describe "food_items/show", type: :view do
  before do
    @food_item = assign(:food_item, FoodItem.create!(
                                      category: nil,
                                      name: "Name",
                                      weight: 2.5,
                                    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/2.5/)
  end
end
