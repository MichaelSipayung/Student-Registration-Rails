class StaticPagesController < ApplicationController
  def home
    #needed since we pass instance variable to static controller
    if logged_in?
      @micropost  = current_user.microposts.build
      #feed_itemsd: show current feed item
      @feed_items  = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
