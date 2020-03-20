require "rails_helper"

RSpec.describe StorageTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/storage_types").to route_to("storage_types#index")
    end

    it "routes to #new" do
      expect(:get => "/storage_types/new").to route_to("storage_types#new")
    end

    it "routes to #show" do
      expect(:get => "/storage_types/1").to route_to("storage_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/storage_types/1/edit").to route_to("storage_types#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/storage_types").to route_to("storage_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/storage_types/1").to route_to("storage_types#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/storage_types/1").to route_to("storage_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/storage_types/1").to route_to("storage_types#destroy", :id => "1")
    end
  end
end
