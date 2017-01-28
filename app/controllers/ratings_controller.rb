class RatingsController < ApplicationController

  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @posts = Post.all
  end

  def create
    Rating.create params.require(:rating).permit(:score, :post_id)
    redirect_to ratings_path
  end

end
