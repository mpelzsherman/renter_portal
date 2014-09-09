Rails.application.routes.draw do
  devise_for :landlords, controllers: {registrations: 'registrations'}
  devise_for :tenants, controllers: {registrations: 'registrations', omniauth_callbacks: "omniauth_callbacks" }

  get 'home/index'
  root to: "home#index"

  resources :tenants do
    resources :service_requests, controller: 'tenant_service_request'
    resources :service_request_comments, only: [:create, :edit, :destroy]
  end

  resources :landlords do
    resources :service_requests, controller: 'landlord_service_request'
    resources :service_request_comments, only: [:create, :edit, :destroy]
  end

  resources :properties

  resources :payments do
    member do
      get :index
    end
  end
end
