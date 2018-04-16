Rails.application.routes.draw do

  resources :complaint_chats
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match ':controller(/:action(/:id))', :via => [:get, :post]

  post 'auth/user_login' => 'auth#user_login'
  post 'auth/admin_login' => 'auth#admin_login'
  delete 'auth/logout_user' => 'auth#logout_user'
  delete 'auth/logout_admin' => 'auth#logout_admin'
  post 'complaints/create_complaint' => 'complaints#create_complaint'
  post 'complaints/show_user_complaints' => 'complaints#show_user_complaints'
  post 'complaint_chats/create_chat' => 'complaint_chats#create_chat'
  post 'complaint_chats/show_complaint_chats' => 'complaint_chats#show_complaint_chats'
  resources :admin_users do
    collection do
      get 'unverified_users'
    end
  end
  resources :users do
    resources :complaints do
      resources :complaint_chats do
       collection do

       end 
      end
      end 
    end
 
  resources :complaint_updates do
  end
end
