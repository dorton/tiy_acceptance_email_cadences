Rails.application.routes.draw do

  post '/cohorts/:cohort_id/send_mail', to: 'students#send_mail', as: 'send_email'

  get 'home/index'

  resources :code_challenges

  resources :announcements


  resources :cohorts do
    resources :students
  end

  root to: "home#index"

  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
