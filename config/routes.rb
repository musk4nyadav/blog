Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :blog_posts do 
    resources :comments 
  end

  resources :comments do
    resources :comments
  end
  
  get "blog_posts/:id/archive" , to: "blog_posts#archive"
  get "blog_posts/:id/unarchive" , to: "blog_posts#unarchive"
  get "users", to: "users#index"

  root "blog_posts#index" 

  
end
