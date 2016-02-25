Rails.application.routes.draw do
  devise_for :users

  resources :conversations do
    resources :messages
  end

  root 'conversations#index'
  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
