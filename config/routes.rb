Rails.application.routes.draw do
  resources :cities
  namespace :api do
    namespace :v1 do
      get 'cities/index'
      post 'cities/create'
      delete 'cities/:id', to: 'cities#destroy'
    end
  end

  root "cities#index"
end
