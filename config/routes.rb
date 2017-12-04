Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create]

  resources :courses do
    resources :topics, shallow: true, only: [:show,:create, :destroy] do
      resources :materials, only: [:create, :destroy, :update, :show]
    end
  end

  resources :students
  resources :cohorts, shallow: true, only: [:new, :show,:create, :destroy, :index]
  root 'welcome#index'

end
