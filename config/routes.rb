Rails.application.routes.draw do


  root 'words#index'

  resources :words do
    get :generate, on: :collection
    post :remove_all, on: :collection
    post :remove_one, on: :collection
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
