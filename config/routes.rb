Rails.application.routes.draw do
  resources :speeches
  get '/' => 'static_page#index'
  
  devise_scope :users do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
    # get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users, :skip => [:registrations] 
  as :user do
  get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end
  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "speeches#index"
end
