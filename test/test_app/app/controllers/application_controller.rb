class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found, :layout => false
  end
end
