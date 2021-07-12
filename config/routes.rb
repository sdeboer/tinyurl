Rails.application.routes.draw do
  get 'links/index'
  get 'links/edit'
  get 'links/show'
  get 'links/new'
  
  get '/:token', to: 'links#show', as: :tiny
end
