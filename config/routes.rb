Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  
  namespace :admin do
    resources :users do
      get :toolbar, on: :member             
    end 
    resources :orders, only:[:show]
    resources :menus, only:[:show] 
    resources :dishes, only:[:new, :create]
  end
  
  resources :menus, only:[:show]

  resources :orders, only:[:create, :show]
  
  resources :users, only:[:show, :update] do
    get :dashboard, on: :member
  end
  
end
