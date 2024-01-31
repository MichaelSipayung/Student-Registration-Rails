# frozen_string_literal: true
# handle sessions (login, logout, etc.) for the application
class SessionsController < ApplicationController
  skip_before_action :logged_in_user, only: %i[new create] # skip the logged_in_user method for new and create action
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase) # find the user by email
    if user&.authenticate(params[:session][:password])
      if user.activated
        log_in user # log the user in (session)
        # remember user only if the user clicked remember
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        # remember(user)
        redirect_back_or user # automatically convert to the route user_url(user)
      else
        message = 'Account not activated'
        message += 'Check your email for activation link'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      # create an error message
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # for case : we open two tab in browser, in one window we already logout
  def destroy
    # but in other window not yet, so we must allow logout only if login
    log_out if logged_in? # log the user out (session)
    redirect_to root_url # redirect to the root page
  end
end
