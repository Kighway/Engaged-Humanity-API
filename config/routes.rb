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
    end
  end

end
