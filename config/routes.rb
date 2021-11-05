Rails.application.routes.draw do
  get 'sessions/new'
  root to: 'tests#index'

  get :sign_up, to: 'users#new'
  get :log_in, to: 'sessions#new'

  resources :users, only: :create
  resources :sessions, only: :create

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end

    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :result
    end
  end
end
