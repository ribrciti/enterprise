Rails.application.routes.draw do

	root 'invoices#index' 
  resources :invoices
  
end
