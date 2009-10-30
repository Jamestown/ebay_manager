ActionController::Routing::Routes.draw do |map|
  
  map.resources :categories
  map.resources :locations
  map.resources :items
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
