# frozen_string_literal: true
# microposts controller : handle microposts
class MicropostsController < ApplicationController
  # only login user could create and destroy it's post
  before_action :logged_in_user, only: %i[create destroy]
  before_action :correct_user, only: :destroy
  def create
    # the present of current_user is to tell that create it by
    # who already logged in and to make the current user post
    # using build, since we work with collection, return new object of collection
    @micropost = current_user.microposts.build(micropost_params)
    # add image to newly created micropost object
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save # save the post's current user
      flash[:success] = 'Micropost created!'
      redirect_to root_url
    else # handle show when submitted post  return error or fail
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'Micropost deleted'
    # using request.referer is related to  request.original_url
    # variable used in friendly forwarding, since micropost appear in
    # both the home page and user profile page, so it will
    # arrange to redirect to page issuing the delete request in both cases
    redirect_to request.referer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end

  # allow destroy action only for the right user
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
