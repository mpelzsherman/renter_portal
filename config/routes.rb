Rails.application.routes.draw do
  devise_for :landlords
  devise_for :tenants

  get 'home/index'
  root to: "home#index"

end
