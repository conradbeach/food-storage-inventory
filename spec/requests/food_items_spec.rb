require 'rails_helper'

RSpec.describe "FoodItems", type: :request do
  describe "GET /food_items" do
    it "works! (now write some real specs)" do
      get food_items_path
      expect(response).to have_http_status(200)
    end
  end
end