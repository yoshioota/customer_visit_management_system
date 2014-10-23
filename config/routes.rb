Rails.application.routes.draw do

  # アドミン側ルーティング
  get 'admin' => 'admin/home#show'
  namespace :admin do
    resources :customers

    resources :employees do
      member do
        get :edit_customers
        patch :update_customers
      end
    end
  end

  # 一般側ルーティング
  get 'home' => 'home/home#show'
  namespace :home do
    resources :customers do
      resources :visit_histories
    end
  end

  # デバイス設定
  devise_for :employees,
    controllers: {
      registrations: 'employees/registrations',
    }

  # root画面
  root 'welcome#index'

end
