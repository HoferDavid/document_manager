Rails.application.routes.draw do
  # Skip the default sessions routes to avoid conflicts
  devise_for :users, skip: :sessions

  # Define custom session routes
  devise_scope :user do
    get "users/sign_in", to: "devise/sessions#new", as: :new_user_session
    post "users/sign_in", to: "devise/sessions#create", as: :user_session
    get "users/sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end

  resources :documents
  root "documents#index"
end
