# frozen_string_literal: true

module SessionsHelper
  # Logs in the given user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any)
  def current_user
    if (user_id = session[:user_id]) # using temporary session first
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.encrypted[:user_id]) # otherwise look for cookies, decrypt first
      user = User.find_by(id: user_id) # find it
      if user&.authenticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user # get current user by the current cookies
      end
    end
  end

  # Returns true if the user is logged in, false otherwise
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user
  def log_out
    forget(current_user) # forget the user
    session.delete(:user_id)
    @current_user = nil
  end

  # Remember a user in a persistent session
  def remember(user)
    user.remember # store new token to database
    cookies.permanent.encrypted[:user_id] = user.id # encrypt the token and store it
    cookies.permanent[:remember_token] = user.remember_token
  end

  # forgets a persistent session
  def forget(user)
    user.forget # delete the token from database
    cookies.delete(:user_id) # delete the token from cookies
    cookies.delete(:remember_token)
  end

  # redirect to stored location (or to the default)
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default) # redirect to the forwarding url or default
    session.delete(:forwarding_url) # delete the forwarding url
  end

  # store the url trying to be accessed
  def store_location
    # store the url if the request is get
    session[:forwarding_url] = request.original_url if request.get?
  end
end
