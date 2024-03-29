Rails.application.routes.draw do
  constraints -> (r) { !r.env["rodauth"].logged_in? } do
    root 'rodauth#login'
  end
  delete "/close-account", to: "accounts#close_account", as: :close_account
  get 'accounts/home'
  get '/', to: 'main#index'
  get 'reports', to: 'reports#index'
  get 'reports_by_category', to: 'reports#report_by_category'
  get 'reports_by_dates', to: 'reports#report_by_dates'
  get 'main', to: 'main#index'
  resources :operations
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
