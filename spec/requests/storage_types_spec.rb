# frozen_string_literal: true

require "rails_helper"

RSpec.describe "StorageTypes", type: :request do
  describe "GET /storage_types" do
    xit "works! (now write some real specs)" do
      get storage_types_path
      expect(response).to have_http_status(:ok)
    end
  end
end
