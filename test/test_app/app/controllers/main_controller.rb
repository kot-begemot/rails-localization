class MainController < ApplicationController
  def index
    render plain: t('main.index')
  end

  def welcome
    render plain: t('main.welcome')
  end
end
