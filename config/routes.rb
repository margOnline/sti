Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  resources :animals
  resources :lions, :controller => 'animals', :type => 'Lion'
  resources :meerkats, :controller => 'animals', :type => 'Meerkat'
  resources :wild_boars, :controller => 'animals', :type => 'WildBoar'
  root 'animals#index'

end
