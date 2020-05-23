# frozen_string_literal: true

require "rails_helper"

RSpec.describe "storage_types/new", type: :view do
  before do
    assign(:storage_type, StorageType.new(
                            user: nil,
                            name: "MyString",
                          ))
  end

  it "renders new storage_type form" do
    render

    assert_select "form[action=?][method=?]", storage_types_path, "post" do
      assert_select "input[name=?]", "storage_type[user_id]"

      assert_select "input[name=?]", "storage_type[name]"
    end
  end
end
