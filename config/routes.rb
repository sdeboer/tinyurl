Rails.application.routes.draw do
  get 'links/index'
  get 'links/edit'
  get 'links/:token', to: 'links#show'
  get 'links/new'
  
  get '/:token', to: 'links#destination', as: :tiny
end
