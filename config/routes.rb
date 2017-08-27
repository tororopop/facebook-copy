Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    authenticated :user do
      root :to => 'topics#index', as: :authenticated_root
    end
    unauthenticated :user do
      root :to => 'users/registrations#new', as: :unauthenticated_root
    end
  end

  resources :topics do
    resources :comments
    resources :likes, only: [:create, :destroy]
  end


  resources :users, only: [:index, :show]

  resources :relationships, only: [:create, :destroy]

  resources :conversations do
    resources :messages
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

end
