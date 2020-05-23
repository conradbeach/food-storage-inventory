# frozen_string_literal: true

require "rails_helper"

RSpec.describe "storage_types/index", type: :view do
  before do
    assign(:storage_types, [
             StorageType.create!(
               user: nil,
               name: "Name",
             ),
             StorageType.create!(
               user: nil,
               name: "Name",
             ),
           ])
  end

  it "renders a list of storage_types" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Name".to_s, count: 2
  end
end
