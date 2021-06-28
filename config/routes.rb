Rails.application.routes.draw do

 devise_for :admin, controllers: {
  sessions:      'admin/sessions',
  passwords:     'admin/passwords',
  registrations: 'admin/registrations'
}
devise_for :customers, controllers: {
  sessions:      'public/sessions',
  passwords:     'public/passwords',
  registrations: 'public/registrations'
}

 namespace :admin do
 get '/' => 'homes#top'
 resources :items, except: [:destroy]
 resources :genres, except: [:destroy, :new, :show]
end

scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only:[:show, :index]
end
end