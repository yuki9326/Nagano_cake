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
 resources :customers, only: [:index, :show, :edit, :update]
end

scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :items, only:[:show, :index]
    resources :cart_items, only:[:index, :update, :destroy, :create]
    delete 'cart_items/clear' => 'cart_items#clear'
end
end