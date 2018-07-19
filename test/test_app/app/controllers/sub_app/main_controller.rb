class SubApp::MainController < ApplicationController
  def print_redirect
    render plain: sub_app_engine.print_redirect_path
  end

  def index
    render plain: t('sub_app.main.index')
  end

  def welcome
    render plain: sub_app_engine.print_redirect_path(locale: :ru)
  end
end
