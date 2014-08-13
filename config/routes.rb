Rails.application.routes.draw do
  devise_for :landlords, controllers: {registrations: 'registrations'}
  devise_for :tenants, controllers: {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks" }

  get 'home/index'
  root to: "home#index"

  resources :tenants do
    resources :service_requests, controller: 'tenant_service_request'
  end

  resources :landlords do
    resources :service_requests, controller: 'landlord_service_request'
  end

  resources :properties

  resources :payments do
    member do
      get :index
    end
  end
end
