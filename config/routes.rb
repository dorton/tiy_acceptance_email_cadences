Rails.application.routes.draw do

  resources :code_challenges

  resources :cohorts do
    resources :students
    resources :announcements
  end

  devise_for :users
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
