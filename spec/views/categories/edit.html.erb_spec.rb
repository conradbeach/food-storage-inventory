# frozen_string_literal: true

require "rails_helper"

RSpec.describe "categories/edit", type: :view do
  let(:category) do
    assign(
      :category,
      Category.create!(
        storage_type: nil,
        name: "MyString",
      ),
    )
  end

  xit "renders the edit category form" do
    render

    assert_select "form[action=?][method=?]", category_path(category), "post" do
      assert_select "input[name=?]", "category[storage_type_id]"

      assert_select "input[name=?]", "category[name]"
    end
  end
end
