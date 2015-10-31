Rails.application.routes.draw do

  get 'bookstores/new'

  post 'bookstores/create'

  get 'sessions/create'

  get 'books/index'

  get 'books/new'

  get 'books/show'

  post 'books/store'

  get 'books/map'

  get 'users/index'

  get 'users/show'

  get 'users/new'

  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
    resources :users
    resources :books
    resources :bookstores

  root 'books#new'

  
end
