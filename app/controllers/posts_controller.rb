class PostsController < ApplicationController
  def ping
    response = HTTP.get("https://api.hatchways.io/assessment/blog/posts?tag=tech")
    if response.status.success? == true
      render json: { message: "successful" }
    else
      render json: { message: "failed" }
    end
  end

  def index
    response = HTTP.get("https://api.hatchways.io/assessment/blog/posts?tag=tech").parse(:json)
    render json: response
  end
end
