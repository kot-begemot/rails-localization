TestApp::Application.routes.draw do
  get :users, :to => "users#index"
  get "users/with_locale", :to => "users#with_locale"
  get "users/without_locale", :to => "users#without_locale"
  get "users/with_defined_locale", :to => "users#with_defined_locale"
  get :welcome, :to => 'main#welcome'

  root :to => 'main#index'
end
