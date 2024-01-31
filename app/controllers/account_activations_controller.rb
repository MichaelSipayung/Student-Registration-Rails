# frozen_string_literal: true

# account activations controller : handle account activations
class AccountActivationsController < ApplicationController
  before_action :logged_in_user, except: [:edit]
  # edit action for token activation
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate # activate user, or update attribute
      log_in user
      flash[:success] = 'Account activated'
      redirect_to user
    else # fail activated
      flash[:danger] = 'Invalid activation link'
      redirect_to root_url
    end
  end
end
