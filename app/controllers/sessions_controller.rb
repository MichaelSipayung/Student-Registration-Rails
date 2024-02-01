# frozen_string_literal: true

# handle sessions (login, logout, etc.) for the application
class SessionsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: [:create]
  skip_before_action :logged_in_user, only: %i[new create] # skip the logged_in_user method for new and create action

  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase) # find the user by email
    if user&.authenticate(params[:session][:password])
      if user.activated
        log_in user # log the user in (session)
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user # automatically convert to the route user_url(user)
      else
        message = 'Account not activated'
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # def create
  #   user = User.find_by(email: params[:session][:email].downcase)
  #   if user&.authenticate(params[:session][:password])
  #     if user.activated
  #       log_in user
  #       params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  #       respond_to do |format|
  #         format.html { redirect_back_or user }
  #         format.json { render json: { success: true, user: user }, status: :ok }
  #       end
  #     else
  #       message = 'Account not activated'
  #       flash[:warning] = message
  #       respond_to do |format|
  #         format.html { redirect_to root_url }
  #         format.json { render json: { success: false, message: message }, status: :unauthorized }
  #       end
  #     end
  #   else
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     respond_to do |format|
  #       format.html { render 'new' }
  #       format.json { render json: { success: false, message: 'Invalid email/password combination' }, status: :unauthorized }
  #     end
  #   end
  # end

  # for case : we open two tab in browser, in one window we already logout
  def destroy
    # but in other window not yet, so we must allow logout only if login
    log_out if logged_in? # log the user out (session)
    redirect_to root_url # redirect to the root page
  end
end
