Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :batches, except: [:destroy] do
    resources :students do
      resources :evaluations, except: [:destroy] do
        resources :comments
      end

    end
  end
end
