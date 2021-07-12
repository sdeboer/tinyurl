Rails.application.routes.draw do
  resources :links
  
  get '/:token', to: 'links#destination', as: :tiny
end
