Rails.application.routes.draw do

  resources :home, only: :index do
    collection do
      get :upload, action: 'upload_form'
      post :upload, action: 'upload_process'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'home#index'
end
