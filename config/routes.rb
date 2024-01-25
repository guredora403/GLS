Rails.application.routes.draw do
  root 'home#index'
  get 'prompts' => 'prompts#index'
  get 'prompts/:id' => 'prompts#show'
  get '/new' => 'prompts#new_form'
  get '/prompts/:id/new' => 'prompts#new_content'
  post '/prompts/:id/new' => 'prompts#add_content'
  post '/new' => 'prompts#new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
