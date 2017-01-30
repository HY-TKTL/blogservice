class RatingsController < ApplicationController

  before_action :authorize, except: [:index]

  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @posts = Post.all
  end

  def create
    rating_params = params.require(:rating).permit(:score, :post_id)
    rating = Rating.new(rating_params)
    rating.user = current_user
    rating.save
    redirect_to ratings_path
  end

end
