Oscapp::Application.routes.draw do

  get "tags/index"

  get "tags/show"

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'
  
  resources :diaries

  resources :tags

  resources :events

  resources :flickr

  resources :authors

  resources :author_sessions,
            only: [ :new, :create, :destroy ]

  match 'login' => 'author_sessions#new'
  match 'logout' => 'author_sessions#destroy'


  root :to => 'welcome#index'

  match 'index' => 'welcome#index'
  match 'aboutus' => 'welcome#aboutus'
  match 'contactus' => 'welcome#contactus'
  match 'faq' => 'welcome#faq'
  match 'social' => 'welcome#social'
  match 'racingteam' => 'welcome#racingteam'
  match 'lessons' => 'welcome#lessons'
  match 'gallery' => 'welcome#gallery'
  

  
end
