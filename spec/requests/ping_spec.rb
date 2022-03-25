require "rails_helper"

RSpec.describe "Pings", type: :request do
  describe "GET /api/ping" do
    it "should return a status of 200" do
      get "/api/ping"
      expect(response).to have_http_status(200)
    end
  end
end
