class UsersController < ApplicationController
  #show all users
  def index
    @users = User.all
  end
  #new : action to create a new user
  def new
    @user = User.new #create new user
  end
  #show : action to show the user
  def show
    @user = User.find(params[:id])
    #add debugger
    #debugger
  end
  #create : action to create a new user
  def create
    @user = User.new(user_params) #create new user
    if @user.save #if the user is saved
      log_in @user #log in user, save the session after the user is saved (session)
      flash[:success] = "Welcome to the Sample App!" #flash message
      redirect_to @user #redirect to the user page
    else #if the user is not saved
      render 'new' #render the new page
      puts @user.errors.full_messages #print the error message
    end
  end
  private
  #user_params : permit the user to input name, email, password, and password_confirmation
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
