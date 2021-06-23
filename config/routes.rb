Rails.application.routes.draw do

  namespace :admin do

 devise_for :admins
 get '/' => 'homes#top'
 resources :items, except: [:destroy]
  end

end