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

      posts = []
      id = {}
      response = HTTP.get("https://api.hatchways.io/assessment/blog/posts?tag=#{tags[0]}").parse(:json)["posts"]
      index = 0
      while index < response.length
        posts << response[index]
        next_id = response[index]["id"]
        id[next_id] = true
        index += 1
      end

      index1 = 1
      while index1 < tags.length
        response = HTTP.get("https://api.hatchways.io/assessment/blog/posts?tag=#{tags[index1]}").parse(:json)["posts"]
        index1 += 1
        index2 = 0
        while index2 < response.length
          next_id = response[index2]["id"]
          if id[next_id]
            index2 += 1
          else
            posts << response[index2]
            id[next_id] = true
            index2 += 1
          end
        end
      end
      render json: posts
    end
  end
end
