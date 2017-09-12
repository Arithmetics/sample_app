module SessionsHelper



  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # Forgets a user after a log_out
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #Returns the current logged in user to the pages
  def current_user
    if (user_id = session[:user_id]) #not a comparrison, this is an assignment!
      #I think this will only return a true if session exists and it just saves a step of assign later
      @current_user ||= User.find_by(id: user_id) #user_id used here now
    elsif (user_id = cookies.signed[:user_id]) #same deal here
      user = User.find_by(id: user_id) #same
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end



end
