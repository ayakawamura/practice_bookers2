Rails.application.routes.draw do
  
  get 'sub/top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "homes#top"
  get "about" => "homes#about" 
  
  resources :users ,only:[:index,:show,:edit,:update]
  resources :books
end
