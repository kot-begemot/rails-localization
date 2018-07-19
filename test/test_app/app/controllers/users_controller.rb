class UsersController < ApplicationController
  def index
    render plain: t('users.index')
  end

  def with_locale
    render plain: users_path, layout: false
  end

  def without_locale
    render plain: users_path(:locale => false), layout: false
  end

  def with_defined_locale
    render plain: users_path(:locale => :ru), layout: false
  end
end
