Rails.application.routes.draw do
  devise_for :landlords, controllers: {registrations: 'registrations'}
  devise_for :tenants, controllers: {registrations: 'registrations'}

  get 'home/index'
  root to: "home#index"

  resources :tenants
  resources :landlords

  resources :payments do
    member do
      get :index
    end
  end
end
