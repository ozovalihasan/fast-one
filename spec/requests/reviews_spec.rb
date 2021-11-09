require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/reviews/index"
      expect(response).to have_http_status(:success)
    end
  end

end
