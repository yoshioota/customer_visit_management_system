Rails.application.routes.draw do

  get 'admin' => 'admin/home#show'

  namespace :admin do

    resources :customers do
      resources :visit_histories
    end

    resources :employees do
      member do
        get :edit_customers
        patch :update_customers
      end
    end
  end

  get 'home' => 'home#show'

  resources :customers do
    resources :visit_histories
  end

  devise_for :employees

  root 'welcome#index'

end
