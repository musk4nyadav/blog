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
  
  get "comments/allreplies/:comment_id" , to: "comments#allreplies"

  # Defines the root path route ("/")
  root "blog_posts#index" 

  
end
