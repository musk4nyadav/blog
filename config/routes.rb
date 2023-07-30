Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # get "blog_posts/:id", to: "blog_posts#show"
  # root "blog_posts#index" 

  resources :blog_posts do 
    resources :comments 
  end

  resources :comments do
    resources :comments
  end
  
  get "blog_posts/:id/archive" , to: "blog_posts#archive"
  get "blog_posts/:id/unarchive" , to: "blog_posts#unarchive"

  # Defines the root path route ("/")
  root "blog_posts#index" 

  
end
