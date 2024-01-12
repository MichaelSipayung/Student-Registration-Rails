class MicropostsController < ApplicationController
  #only login user could create and destroy it's post
  before_action :logged_in_user, only: [:create, :destroy]
  def create
    #the present of current_user is to tell that create it by
    # who already logged in and to make the current user post
    # using build, since we work with collection, return new object of collection
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save #save the post's current user
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
