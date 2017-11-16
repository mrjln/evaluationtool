Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :comments

  resources :batches, except: [:destroy] do
    resources :students do
      resources :evaluations, except: [:destroy]
      
    end
  end
end
