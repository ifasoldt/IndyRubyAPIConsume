Rails.application.routes.draw do

  root 'posts#index'
  get '/recent_activity/(:user)' => 'posts#recent_activity', as: :recent_activity
  get '/repositories/:user' => 'posts#repositories', as: :repositories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
