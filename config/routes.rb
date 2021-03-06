Rails.application.routes.draw do
  resources :users do
    resources :accounts do
      resources :movements do
          member do
            # get :action
            # put :action

            get 'movement_child'
            get 'create_clone'

            # delete :action
post 'add_movement_child'
          end

    end
  end
  end

  post '/movements/:id/create_clone', to: 'movements#add_movement_child', as: 'add_movement_child' 
  post '/movements/:id/child', to: 'movements#add_register_child', as: 'add_register'
  resources :users do
    resources :categories
  end

  resources :users do
    resources :history_movements do
      collection do
        get 'current_record'
        get 'previous_record'
        post 'previous_record'
      end
    end
  end

  get '/download',  to: 'history_movements#download'

  # post  'account',  to: 'accounts#index'
  post  '/users/:user_id/accounts/new',  to: 'accounts#create'
  post  '/users/:user_id/categories/new',  to: 'categories#create'
  post  '/users/:user_id/accounts/:account_id/movements/new',  to: 'movements#create'


  # post  '/users/:user_id/accounts/:account_id/movements/:id/create_clone'
  # get 'sessions/new'
  # post '/users/:user_id/accounts/:account_id/movements/:id/edit',  to: 'accounts#edit'
  #post '/users/:user_id/accounts/:account_id/movements/:id/edit',  to: 'movements#edit'


  get 'sessions/new'

  # get 'users/new'

  root 'static_pages#home'
    get  '/help',    to: 'static_pages#help'
    get  '/about',   to: 'static_pages#about'
    get  '/contact', to: 'static_pages#contact'

    resources :users
    # get  '/signup',  to: 'users#new'
    # post '/signup',  to: 'users#create'

    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'


end
