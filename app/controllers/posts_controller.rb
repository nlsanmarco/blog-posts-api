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
    if params[:tag]
      response = HTTP.get("https://api.hatchways.io/assessment/blog/posts?tag=#{params[:tag]}").parse(:json)
      render json: response
    elsif params[:tags]
      tags = params[:tags].split(",")
      # render json: tags
      response = HTTP.get("https://api.hatchways.io/assessment/blog/posts?tag=#{tags[0]}").parse(:json)
      render json: response
    end
  end
end
