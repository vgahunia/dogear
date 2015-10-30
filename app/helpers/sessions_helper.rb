module SessionsHelper

	# defines the current user from the presence of a session
	def current_user
    if session[:user_id]       
			@current_user = User.find(session[:user_id])    
		end 
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
  end
  
end
