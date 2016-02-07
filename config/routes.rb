Rails.application.routes.draw do

  #get 'welcome/index'

  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/faq'

  get 'welcome/pricing'

  get 'welcome/features'

	root to:'welcome#index' 
  resources :invoices
  
end
