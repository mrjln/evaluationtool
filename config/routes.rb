Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :batches, only: [:index, :show, :update] do
    resources :students, only: [:index, :show]
  end
end
