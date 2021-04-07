Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get "about" => "homes#about" , as: "about"
  resources :books, only:[:index,:show,:new,:create,:edit,:update,:destroy]
  resources :users, only:[:index,:show,:edit,:update,:destory]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
