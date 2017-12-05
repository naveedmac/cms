Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resource :session, only: [:new, :create, :destroy]
    resources :users, only: [:new, :create]

  resources :courses do
    resources :topics, shallow: true, only: [:show,:create, :destroy, :new] do
      resources :materials, only: [:create, :destroy, :update, :show, :new]
    end
  end


  resources :cohorts, shallow: true, only: [:new, :show,:create, :destroy, :index]
  root 'welcome#index'

end
