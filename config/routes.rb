Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :batches, only: [:index, :show] do
    resources :students, only: [:index]
  end
end
