Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  
  namespace :admin do
    resources :users do
      get :toolbar, on: :member
    end
  end
  
  resources :users, only:[:show, :edit]
  
end
