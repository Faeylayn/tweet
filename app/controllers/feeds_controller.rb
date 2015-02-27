class FeedsController < ApplicationController
  before_action :require_logged_in!

  LIMIT = 10

  def show
    # fail unless params[:max_created_at].nil?
    @feed_tweets =
      current_user.feed_tweets(LIMIT, params[:max_created_at]).includes(:user)
    respond_to do |format|
      format.html { render :show }
      format.json { render :show }
    end
  end
end
