class PasswordResetsController < ApplicationController
  #Because confirmation of the existence of a valid @user
  # is needed in both the update and edit actions
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  #make sure the reset password is not expired
  before_action :check_expiration, only: [:edit, :update]
  def new
  end
  def update
    if params[:user][:password].empty? #empty password
      @user.errors.add(:password, "Can't be empty")
      render 'edit'
    elsif @user.update(user_params) #right value
      log_in @user
      flash[:success] = "Password has been reset"
      redirect_to @user
    else #invalid password
      render 'edit'
    end
  end
  def create
    @user  = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render 'new'
    end
  end

  def edit
  end

  private
    def get_user #only valid user can get request edit password
      @user  = User.find_by(email: params[:email])
    end
    #confirms a valid user
    def valid_user #if not  valid user, not activated or nil
      unless @user && @user.activated? &&
        @user.authenticated?(:reset, params[:id])
        redirect_to root_url
      end
    end
  def check_expiration #the expired link will not allow to update password
    if @user.password_reset_expired?
      flash[:danger] = "Password reset has expired"
      redirect_to new_password_reset_url
    end
  end
  def user_params #prevent user submit other information except password
    params.require(:user).permit(:password, :password_confirmation)
  end
end
