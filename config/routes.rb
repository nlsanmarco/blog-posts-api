Rails.application.routes.draw do
  get "/api/ping" => "posts#ping"
  get "/api/posts" => "posts#index"
end
