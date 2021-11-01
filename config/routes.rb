Rails.application.routes.draw do
  resources :tickets
  resources :venues
  devise_for :users
  Healthcheck.routes(self)
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  resources :events
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
