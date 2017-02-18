DestroyAllTasks::Application.routes.draw do

resources :profiles, only: [:show, :edit, :update]

match 'signup', to: 'users#new', as: 'signup', via: [:get]
match 'login', to: 'sessions#new', as: 'login', via: [:get, :post]
match 'logout', to: 'sessions#destroy', as: 'logout', via: [:post]

match 'overview', to: 'pages#overview', as: 'overview', via: [:get]
match 'style-guide', to: 'pages#style_guide', as: 'style_guide', via: [:get]

match 'tags/:tags' => 'tasks#tags', as: 'tags', via: [:get]
match 'untagged' => 'tasks#untagged', as: 'untagged', via: [:get]


resources :sessions
resources :users
resources :comments

resources :tasks, except: [:new] do
  collection { post :sort }
  collection { get :punted }
  collection { post :punt_all_tagged_tasks }
  collection { post :punt_all_tasks }
  collection { put :delete_all_tagged_tasks }
end

root :to => 'pages#index'
end
