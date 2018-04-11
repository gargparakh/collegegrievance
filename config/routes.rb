Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #match ':controller(/:action(/:id))', :via => [:get, :post]


  
  post 'auth/user_login' => 'auth#user_login'
  post 'auth/admin_login' => 'auth#admin_login'
  delete 'auth/logout_user' => 'auth#logout_user'
  delete 'auth/logout_admin' => 'auth#logout_admin'
  resources :admin_users

  resources :users do
    collection do
      post :signup
    end
    resources :complaints do
      resources :complaint_updates
    end
  end
end
