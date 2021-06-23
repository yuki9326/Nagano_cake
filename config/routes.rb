Rails.application.routes.draw do

  devise_for :admins
 get '/admin' => 'admin/homes#top'
end