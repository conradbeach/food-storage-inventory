# frozen_string_literal: true

require "rails_helper"

RSpec.describe "FoodItems", type: :request do
  describe "GET /food_items" do
    xit "works! (now write some real specs)" do
      get food_items_path
      expect(response).to have_http_status(:ok)
    end
  end
end
