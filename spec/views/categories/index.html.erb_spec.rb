# frozen_string_literal: true

require "rails_helper"

RSpec.describe "categories/index", type: :view do
  before do
    assign(:categories, [
             Category.create!(
               storage_type: nil,
               name: "Name",
             ),
             Category.create!(
               storage_type: nil,
               name: "Name",
             ),
           ])
  end

  it "renders a list of categories" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
