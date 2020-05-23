# frozen_string_literal: true

require "rails_helper"

RSpec.describe "storage_types/edit", type: :view do
  before do
    @storage_type = assign(:storage_type, StorageType.create!(
                                            user: nil,
                                            name: "MyString",
                                          ))
  end

  it "renders the edit storage_type form" do
    render

    assert_select "form[action=?][method=?]", storage_type_path(@storage_type), "post" do
      assert_select "input[name=?]", "storage_type[user_id]"

      assert_select "input[name=?]", "storage_type[name]"
    end
  end
end
