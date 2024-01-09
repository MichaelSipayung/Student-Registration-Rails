class AccountActivationsController < ApplicationController
  def edit #edit action for token activation
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      # user.update_attribute(:activated, true)
      # user.update_attribute(:activated_at, Time.zone.now)
      user.activate #activate user, or update attribute
      log_in user
      flash[:success] = "Account activated"
      redirect_to user
    else #fail activated
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end
