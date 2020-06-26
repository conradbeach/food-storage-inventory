# frozen_string_literal: true

require "rails_helper"

RSpec.describe FoodItemsController, type: :routing do
  describe "routing" do
    xit "routes to #index" do
      expect(get: "/food_items").to route_to("food_items#index")
    end

    xit "routes to #new" do
      expect(get: "/food_items/new").to route_to("food_items#new")
    end

    xit "routes to #show" do
      expect(get: "/food_items/1").to route_to("food_items#show", id: "1")
    end

    xit "routes to #edit" do
      expect(get: "/food_items/1/edit").to route_to("food_items#edit", id: "1")
    end

    xit "routes to #create" do
      expect(post: "/food_items").to route_to("food_items#create")
    end

    xit "routes to #update via PUT" do
      expect(put: "/food_items/1").to route_to("food_items#update", id: "1")
    end

    xit "routes to #update via PATCH" do
      expect(patch: "/food_items/1").to route_to("food_items#update", id: "1")
    end

    xit "routes to #destroy" do
      expect(delete: "/food_items/1").to route_to("food_items#destroy", id: "1")
    end
  end
end
