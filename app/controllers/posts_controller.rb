class PostsController < ApplicationController
  def index
    response = HTTP.get("https://api.hatchways.io/assessment/blog/posts?tag=tech").parse(:json)
    render json: response
  end
end
