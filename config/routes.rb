Rails.application.routes.draw do
  match("/", { :controller => "pictures", :action => "recent", :via => "get" })

  match("/recent", { :controller => "pictures", :action => "recent", :via => "get" })

  match("/popular", { :controller => "pictures", :action => "most_liked", :via => "get" })

  match("/photos/:some_id", { :controller => "pictures", :action => "show_details", :via => "get" })

  match("/users", { :controller => "users", :action => "index", :via => "get" })

  match("/users/:id", { :controller => "users", :action => "show", :via => "get" })

  match("/users/:id/liked", { :controller => "users", :action => "liked_photos", :via => "get" })

  match("/users/:id/feed", { :controller => "users", :action => "feed", :via => "get" })

  match("/users/:id/discover", { :controller => "users", :action => "discover", :via => "get" })

  match("/delete_photo/:id_to_delete", { :controller => "pictures", :action => "byyyyeeeee", :via => "get" })

  match("/new_photo_form", { :controller => "pictures", :action => "blank_form", :via => "get" })

  match("/create_photo_record", { :controller => "pictures", :action => "save_new_row", :via => "get" })

  match("/existing_photo_form/:id_to_update", { :controller => "pictures", :action => "prefilled_form" , :via => "get" })

  match("/update_photo_record/:id_to_update", { :controller => "pictures", :action => "update_row" , :via => "get" })
  
  match("/add_new_fan", { :controller => "pictures", :action => "add_new_fan" , :via => "get" })
  
  match("/add_new_comment", { :controller => "pictures", :action => "add_new_comment" , :via => "get" })
  
  match("/users/:id/following", { :controller => "users", :action => "following" , :via => "get" })

  match("/users/:id/followers", { :controller => "users", :action => "followers" , :via => "get" })
  
  match("/send_follow_request", { :controller => "users", :action => "send_request" , :via => "get" })
  
  match("/update_accept_follower", { :controller => "users", :action => "accept_follower" , :via => "get" })
    
  match("/update_reject_follower", { :controller => "users", :action => "reject_follower" , :via => "get" })
    
  # The routes below are for the ActiveAdmin dashboard located at /admin. You can ignore them.
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
