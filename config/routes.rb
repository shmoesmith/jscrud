Rails.application.routes.draw do
 root 'planets#index'

 resources :planets do
   resources :characters
  end
 end