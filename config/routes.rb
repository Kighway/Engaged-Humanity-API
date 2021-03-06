Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :users
      resources :articles
      post 'signup', to: 'users#create'
      post 'signin', to: 'users#login'
      get 'current_user', to: 'users#the_current_user'
      post 'articles/:id/like', to: 'articles#like_article'
      post 'add-interest', to: 'users#add_interest'
      post 'search-following', to: 'users#search_following'
      post 'toggle-following', to: 'users#toggle_following'
      post 'switch-like', to: 'articles#switch_like'
      post 'check-username', to: 'users#check_username'
      post 'articles/new', to: 'articles#create'
      get 'interests', to: 'interests#index'
      post 'remove-interest', to: 'users#remove_interest'
    end
  end

end
