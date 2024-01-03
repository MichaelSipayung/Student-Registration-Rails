# handle sessions (login, logout, etc.) for the application
class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase) #find the user by email
    if user && user.authenticate(params[:session][:password])
      log_in user #log the user in (session)
      remember(user)
      redirect_to user #automatically convert to the route user_url(user)
    else
      #create an error message
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?#log the user out (session)
    redirect_to root_url #redirect to the root page
  end
end
