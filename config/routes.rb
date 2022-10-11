Rails.application.routes.draw do
  devise_for :users
  resources :quotes do
    resources :line_item_dates, except: [:show, :index]
  end
  root 'pages#home'
end
