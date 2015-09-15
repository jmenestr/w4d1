Rails.application.routes.draw do
  resources :users, except: [:new, :edit] do
    resources :contacts, only: [:index]
    resources :comments, only: [:index]
    member do
      get 'favorite'
    end
  end

  resources :contacts, except: [:new, :edit, :index] do
    resources :comments, only: [:index]
  end
  resources :contact_shares, only: [:create, :destroy]
end
