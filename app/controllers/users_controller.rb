class UsersController < ApplicationController
  #prevent use update data or delete without login first
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  #show all users
  def index
    #@users = User.all
    @users = User.paginate(page: params[:page]) #using pagination style
  end
  #new : action to create a new user
  def new
    @user = User.new #create new user
  end
  #show : action to show the user
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  #create : action to create a new user
  def create
    @user = User.new(user_params) #create new user
    if @user.save #if the user is saved
      #log_in @user #log in user, save the session after the user is saved (session)
      #flash[:success] = "Welcome to the Sample App!" #flash message
      #redirect_to @user #redirect to the user page
      #change the behavior, send email first
      # UserMailer.account_activation(@user).deliver_now
      @user.send_activation_email
      flash[:info] = 'Please check your email to activate your account'
      redirect_to root_url
    else #if the user is not saved
      render 'new' #render the new page
      # puts @user.errors.full_messages #print the error message
    end
  end
  #delete : action to delete the user
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url #redirect to index-all users
  end
  def edit #action for edit a user
    @user = User.find(params[:id])
  end
  def update #update the user
    @user = User.find(params[:id])
    if @user.update(user_params) #update based on passed params
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  #only allow the user to edit their own data
  def correct_user
    @user  = User.find(params[:id])
    redirect_to(root_url) unless current_user == @user
  end

  private
  #user_params : permit the user to input name, email, password, and password_confirmation
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  #refactor since we need this filter, move to application controller
  #Confirm a logged-in user
  # def logged_in_user
  #   unless logged_in?
  #     store_location #store the location of the page that the user want to access
  #     flash[:danger] = "Please log in"
  #     redirect_to login_url
  #   end
  # end
  #confirm an admin user
  def admin_user #protect from attacker
    redirect_to(root_url) unless current_user.admin? #look attribute admin? true:false
  end
end
