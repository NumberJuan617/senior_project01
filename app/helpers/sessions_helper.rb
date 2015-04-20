module SessionsHelper
	# Logs in the given user.RETURNS TRUE IF USER IS LOGGED IN
	def log_in(user)
		session[:user_id] = user.id
	end

	def remember(user)
	    user.remember
	    cookies.permanent.signed[:user_id] = user.id
	    cookies.permanent[:remember_token] = user.remember_token
 	end
	
	# Returns the user corresponding to the remember token cookie.
	def current_user
		if (user_id = session[:user_id])
			@current_user ||= User.find_by(id: user_id)
		elsif (user_id = cookies.signed[:user_id])
			user = User.find_by(id: user_id)
			if user && user.authenticated?(cookies[:remember_token])
				log_in user
				@current_user = user#RAILS RETURNS THE LAST LINE GIVEN SO THIS IS THE RETURN TYPE
			end
		end
	end

	# Returns true if the given user is the current user.
	def current_user?(user)
		user == current_user
	end


	# Returns true if the user is logged in, false otherwise.
	def logged_in?
		!current_user.nil?#in other words; if the current user is not null
	end	

	
	#if true, then the user is not logged in and has not created an account 
	def notLogged_in?
		current_user.nil?
	end

	# Logs out the current user.
	def log_out
		forget(current_user)
		session.delete(:user_id)
		@current_user = nil
	end


	# Forgets a persistent session.
	def forget(user)
		user.forget
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
    end

    #The following methods below are used for Friendly Forwarding. Helps the user get to what they need quicker 
	# Redirects to stored location (or to the default).
	def redirect_back_or(default)
		redirect_to(session[:forwarding_url] || default)
		session.delete(:forwarding_url)
	end

	# Stores the URL trying to be accessed.
	def store_location
		session[:forwarding_url] = request.url if request.get?
	end
end
