class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 include SessionsHelper

 # before_filter :require_login
 #
 #
 # private
 #
 #  def require_login
 #    unless current_user
 #   flash[:danger] = "Please log in."
 #      redirect_to login_url
 #    end
 #  end
 #

end
