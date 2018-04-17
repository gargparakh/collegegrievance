Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #match ':controller(/:action(/:id))', :via => [:get, :post]
  #Auth Controller
  post 'auth/user_login' => 'auth#user_login'
  post 'auth/admin_login' => 'auth#admin_login'
  delete 'auth/logout_user' => 'auth#logout_user'
  delete 'auth/logout_admin' => 'auth#logout_admin'

  #Complaint Controller
  post 'complaints/create_complaint' => 'complaints#create_complaint'
  post 'complaints/show_user_complaints' => 'complaints#show_user_complaints'
  post 'complaints/pending_complaint_list' => 'complaints#pending_complaint_list'
  post 'complaints/resolved_complaint_list' => 'complaints#resolved_complaint_list'
  post 'complaints/show_user_resolved_complaints' => 'complaints#show_user_resolved_complaints'

  #ComplaintChat Controller

  post 'complaint_chats/create_chat' => 'complaint_chats#create_chat'
  post 'complaint_chats/show_complaint_chats' => 'complaint_chats#show_complaint_chats'

  #Resources
  resources :admin_users do
  end
  resources :users do
    resources :complaints do
      resources :complaint_chats do
      end
    end
  end

  resources :complaint_updates do
  end
end
