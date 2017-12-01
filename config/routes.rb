Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses do
    resources :topics, shallow: true, only: [:show,:create, :destroy] do
      resources :materials, only: [:create, :destroy, :update]
    end
  end
  resources :students
  resources :cohorts, shallow: true, only: [:new, :show,:create, :destroy]
  root 'welcome#index'
  
end
