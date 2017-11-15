Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :batches, except: [:destroy]  do
    resources :students, except: [:destroy] do
      resources :evaluations, except: [:destroy]
    end
  end
end
