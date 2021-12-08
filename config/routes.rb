Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users,
             path_names: { sign_in: :log_in, sign_out: :log_out },
             :controllers => {
               sessions: 'sessions'
             }

  get 'users/:id/feedbacks/new', to: 'feedbacks#new', as: :user_new_feedbacks
  post 'users/:id/feedbacks', to: 'feedbacks#create', as: :user_feedbacks

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

  resources :badges, only: :index

  namespace :admin do
    resources :badges

    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index destroy]
  end
end
