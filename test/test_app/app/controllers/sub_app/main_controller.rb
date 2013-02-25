class SubApp::MainController < ApplicationController
  def print_redirect
    render :text => sub_app_engine.print_redirect_path
  end

  def index
    render :text => t('sub_app.main.index')
  end

  def welcome
    render :text => sub_app_engine.print_redirect_path(:locale => :ru)
  end
end
