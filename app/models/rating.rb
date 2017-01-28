class Rating < ActiveRecord::Base
  belongs_to :post

  def to_s
    "#{post.title}, score: #{score}"
  end
end
