module SessionsHelper

	# defines the current user from the presence of a session
	def current_user
    @current_user ||= User.find_by(id: session[:user_id]) 
 	end

	# Log in user
	def log_in(user)
    session[:user_id] = user.id
  end

  # this is test if a current user exists - as a way of removing the menu on the root_path
  def logged_in?
    !current_user.nil?
  end
 
 	# this is for the sign out link
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end
