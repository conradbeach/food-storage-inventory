# frozen_string_literal: true

require "rails_helper"

RSpec.describe "categories/show", type: :view do
  before do
    @category = assign(:category, Category.create!(
                                    storage_type: nil,
                                    name: "Name",
                                  ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
  end
end
