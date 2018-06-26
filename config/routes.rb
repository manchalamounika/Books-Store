Rails.application.routes.draw do

get 'admin', to: 'admin#index'

#get 'login', to: 'access#new'
#post 'login', to: 'access#create'
#delete 'logout', to: 'access#destroy'

  get 'access/new'
  get 'access/create'
  get 'access/destroy'

  get 'admin/index'
  get 'login', to: 'access#new'
  post '/access/new', to: 'access#create'
  delete '/logout', to: 'access#destroy'


  resources :users
  resources :orders
  resources :lineitems
  resources :carts
  #  resources :access
  #resources :admin
  get 'shopper/index'

  resources :products
  root "shopper#index", as: 'root'
  get '/shopper', to: redirect('shopper/index')
  get '/admin', to: redirect('admin/index')

  get 'public/home', to: redirect('/home.html')
  get 'public/questions', to: redirect('/questions.html')
  get 'public/contact', to: redirect('/contact.html')
  get 'public/news', to: redirect('/news.html')

#get '/admin' => 'admin#index', as: 'admin_url'
#post '/login', to: 'access#create', as: 'create_url'
#get '/login', to: 'access#new', as: 'login_url'
#     delete '/logout', to: redirect('access/destroy')
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
