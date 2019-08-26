Rails.application.routes.draw do
  root "assignments#index"

  devise_for :users

  resource :assignments
end
