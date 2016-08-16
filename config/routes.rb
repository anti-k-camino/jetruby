Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  
  namespace :admin do
    resources :users do
      get :toolbar, on: :member
    end   
  end
  
  resources :menus, only:[:show, :update]
  
  resources :users, only:[:show, :update] do
    get :dashboard, on: :member
  end
  
end
