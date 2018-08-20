Rails.application.routes.draw do
  # Routes for the Holding resource:

  # CREATE
  get("/holdings/new", { :controller => "holdings", :action => "new_form" })
  post("/create_holding", { :controller => "holdings", :action => "create_row" })

  # READ
  get("/holdings", { :controller => "holdings", :action => "index" })
  get("/holdings/:id_to_display", { :controller => "holdings", :action => "show" })

  # UPDATE
  get("/holdings/:prefill_with_id/edit", { :controller => "holdings", :action => "edit_form" })
  post("/update_holding/:id_to_modify", { :controller => "holdings", :action => "update_row" })

  # DELETE
  get("/delete_holding/:id_to_remove", { :controller => "holdings", :action => "destroy_row" })

  #------------------------------

  # Routes for the Etf resource:

  # CREATE
  get("/etfs/new", { :controller => "etfs", :action => "new_form" })
  post("/create_etf", { :controller => "etfs", :action => "create_row" })

  # READ
  get("/etfs", { :controller => "etfs", :action => "index" })
  get("/etfs/:id_to_display", { :controller => "etfs", :action => "show" })

  # UPDATE
  get("/etfs/:prefill_with_id/edit", { :controller => "etfs", :action => "edit_form" })
  post("/update_etf/:id_to_modify", { :controller => "etfs", :action => "update_row" })

  # DELETE
  get("/delete_etf/:id_to_remove", { :controller => "etfs", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root "etfs#index"
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
