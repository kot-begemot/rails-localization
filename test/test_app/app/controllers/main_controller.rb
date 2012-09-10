class MainController < ApplicationController
  def index
    render :text => t('main.index')
  end

  def welcome
    render :text => t('main.welcome')
  end
end
