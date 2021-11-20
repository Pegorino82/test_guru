Rails.application.routes.draw do
  # get 'sessions/new'
  root to: 'tests#index'

  devise_for :users,
             path_names: { sign_in: :log_in, sign_out: :log_out },
             :controllers => {
               sessions: 'sessions'
             }

  resources :tests, only: :index do
    member do
      post :start
    end
  end

  resources :results, only: %i[show update] do
    member do
      get :result
    end
  end

  resources :gists, only: :create

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: :index
  end
end
