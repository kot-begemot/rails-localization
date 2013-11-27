class UsersController < ApplicationController
  def index
    render :text => t('users.index')
  end

  def with_locale
    render :text => users_path, :layout => false
  end

  def without_locale
    render :text => users_path, :layout => false
  end

  def with_defined_locale
    render :text => users_path(:locale => :ru), :layout => false
  end
end

