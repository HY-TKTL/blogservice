class Rating < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def to_s
    "#{post.title}, score: #{score}, by #{user.username}"
  end
end
