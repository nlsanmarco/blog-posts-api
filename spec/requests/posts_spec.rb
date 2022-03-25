require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /api/posts" do
    it "should return an error if no tags specified" do
      get "/api/posts"
      expect(response).to have_http_status(400)
    end
    it "should return an array of posts, all containing the tech tag" do
      get "/api/posts?tag=tech"
      expect(response.body).to include("history")
    end
  end
end
