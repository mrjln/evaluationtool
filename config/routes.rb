Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users

  resources :photos, only: [:destroy]

  resources :batches, except: [:destroy] do
    resources :students do
      post "evaluations/create_and_next" => "evaluations#create_and_next"
      resources :evaluations, except: [:destroy] do
        resources :comments
      end

    end
  end
end
