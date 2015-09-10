Rails.application.routes.draw do
  devise_for :users
  resources :tasks
  
  authenticated :user do
    root to: 'tasks#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')
  
end
