class PostsController < ApplicationController
  def index
    response = HTTP.get(https://api.hatchways.io/assessment/blog/posts?tag=tech)
    posts = response.pars(:json)
    render json: posts
  end
end
