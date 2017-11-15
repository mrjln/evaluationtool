Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :batches, except: [:destroy]  do
    resources :students, except: [:destroy] 
  end
end
