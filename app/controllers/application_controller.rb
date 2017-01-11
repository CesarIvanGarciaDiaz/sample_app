class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 include SessionsHelper
<<<<<<< HEAD

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
=======
 
>>>>>>> b185d262203a2c9043fd6915fa771f38e59c4141

end
