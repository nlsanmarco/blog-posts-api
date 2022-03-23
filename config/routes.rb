Rails.application.routes.draw do
  get "/api/posts" => "posts#index"
end
