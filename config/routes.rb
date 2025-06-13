Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'user/auth',
    registrations: 'user/register',
    profile: 'user/profile',
  }, defaults: { format: :json }

  devise_scope :user do
    post '/login',  to: "user/auth#create"
    post '/signup', to: "user/register#create"

    get '/me', to: 'user/profile#index'
    get '/validate_token', to: 'user/validate#validate_token'
  end

  get "up" => "rails/health#show", as: :rails_health_check
end