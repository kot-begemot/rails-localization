class UsersController < ApplicationController
  def index
    render :text => t('users.index')
  end


  def new
    render :text => users_path
  end
end

