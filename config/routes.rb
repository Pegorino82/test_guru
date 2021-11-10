Rails.application.routes.draw do
  # get 'sessions/new'
  root to: 'tests#index'

  devise_for :users,
             path_names: { sign_in: :log_in, sign_out: :sign_out },
             :controllers => {
               registrations: 'registrations',
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

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
