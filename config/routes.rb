Rails.application.routes.draw do
  devise_for :users
  resources :tasks do
    member do
      patch :complete
    end
    collection do
      delete :batch_delete
    end
  end
  
  authenticated :user do
    root to: 'tasks#index', as: :authenticated_root
  end

  root to: redirect('/users/sign_in')
  
end
