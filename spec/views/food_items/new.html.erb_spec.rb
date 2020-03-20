require 'rails_helper'

RSpec.describe "food_items/new", type: :view do
  before(:each) do
    assign(:food_item, FoodItem.new(
      :category => nil,
      :name => "MyString",
      :weight => 1.5
    ))
  end

  it "renders new food_item form" do
    render

    assert_select "form[action=?][method=?]", food_items_path, "post" do

      assert_select "input[name=?]", "food_item[category_id]"

      assert_select "input[name=?]", "food_item[name]"

      assert_select "input[name=?]", "food_item[weight]"
    end
  end
end
