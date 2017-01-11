Rails.application.routes.draw do
  get 'history_movements/current_record'
  get "/history_movements/previous_record", to: 'history_movements#previous_record'
  get "/history_movements/previous_record/:year", to: 'history_movements#previous_record'
  post '/history_movements/previous_record', to: 'history_movements#show'

  get '/history_movements/download'

  resources :users do
      resources :accounts do
        resources :movements#, shallow: true
      end
    end

  get '/users/params[:user_id]/history', to: 'users#index'
  # post  'account',  to: 'accounts#index'
  post  '/users/:user_id/accounts/new',  to: 'accounts#create'
  post  '/users/:user_id/accounts/:account_id/movements/new',  to: 'movements#create'
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
    get  '/signup',  to: 'users#new'
    post '/signup',  to: 'users#create'

    get    '/login',   to: 'sessions#new'
    post   '/login',   to: 'sessions#create'
    delete '/logout',  to: 'sessions#destroy'



end
