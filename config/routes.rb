Rails.application.routes.draw do
  resources :links
  
  root :to => 'links#index'
  
  get '/:token', to: 'links#destination', as: :tiny
end
