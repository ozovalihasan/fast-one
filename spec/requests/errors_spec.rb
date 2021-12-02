require 'rails_helper'

RSpec.describe "Errors", type: :request do
  describe "GET /not_found" do
    it "returns http success" do
      get "/errors/not_found"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /internal_server" do
    it "returns http success" do
      get "/errors/internal_server"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /unprocessable" do
    it "returns http success" do
      get "/errors/unprocessable"
      expect(response).to have_http_status(:success)
    end
  end

end
