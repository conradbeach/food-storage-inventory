# frozen_string_literal: true

require "rails_helper"

RSpec.describe "storage_types/show", type: :view do
  before do
    @storage_type = assign(:storage_type, StorageType.create!(
                                            user: nil,
                                            name: "Name",
                                          ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
