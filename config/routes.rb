Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users #do
  # 	get :index, on: :member
  # end
  post '/login', to: 'sessions#create'

end
