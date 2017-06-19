Rails.application.routes.draw do
 root 'planets#index'

  get 'planet_form', to: 'planets#form'

 resources :planets do
   resources :characters
  end
 end