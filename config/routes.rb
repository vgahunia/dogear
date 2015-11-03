Rails.application.routes.draw do

  get 'users/new'

  get 'sessions/new'

  get 'sessions/create'

  get 'static/home'

  get 'bookstores/new'

  post 'bookstores/create'

  get 'sessions/create'

  get 'books/index'

  get 'books/new'

  get 'books/show'

  post 'books/store'

  get 'bookstores/map'

  get 'users/index'

  get 'users/show'

  get 'signup' => 'users#new'

  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :users
    resources :books
    resources :bookstores

  root 'static#home'

  
end
