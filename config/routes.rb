Rails.application.routes.draw do
  root 'reports#new'
  devise_for :users

  resources :reports, :only => [:new, :create, :show]
  resources :campaign_history_comments, :except => [:new, :create]
  namespace :api do
    resources :reports, :only => [:show]
    resources :campaign_history_comments, :only => [:index]
  end
end
