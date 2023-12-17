Rails.application.routes.draw do
  #below 4 lines removed in 6 movieApp lab code
  #get 'candidates/index'
  #get 'candidates/show'
  #get 'candidates/new'
  #get 'candidates/edit'
  resources :positions do
    resources :candidates
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
