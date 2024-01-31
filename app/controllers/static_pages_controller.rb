# frozen_string_literal: true

class StaticPagesController < ApplicationController
  skip_before_action :logged_in_user, only: %i[home help about contact]
  def home
    # needed since we pass instance variable to static controller
    return unless logged_in?

    @micropost = current_user.microposts.build
    # feed_itemsd: show current feed item
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def help; end

  def about; end

  def contact; end
end
