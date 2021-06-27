Rails.application.routes.draw do


  devise_for :customers
 devise_for :admins

 namespace :admin do
 get '/' => 'homes#top'
 resources :items, except: [:destroy]
 resources :genres, except: [:destroy, :new, :show]
end

scope module: :public do
    root to: 'homes#top'
end
end