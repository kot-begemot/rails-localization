require File.expand_path("../../lib/sub_app", __FILE__)

SubApp::Engine.routes.draw do
  get  :print_redirect, :to => 'main#print_redirect'
  get  :welcome, :to => 'main#welcome'
  root :to => 'main#index'
end

TestApp::Application.routes.draw do
  localized({"en" => "English", "ru" => "Russian"}) do
    mount SubApp::Engine => '/sub', :as => :sub_app_engine

    get :users, :to => "users#index"
    get "users/with_locale", :to => "users#with_locale"
    get :welcome, :to => 'main#welcome'

    root :to => 'main#index'
  end

  get "users/without_locale", :to => "users#without_locale"
  get "users/with_defined_locale", :to => "users#with_defined_locale", locale: "en"
end
