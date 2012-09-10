TestApp::Application.routes.draw do
  resources :users
  get :welcome, :to => 'main#welcome'

  root :to => 'main#index'
end
