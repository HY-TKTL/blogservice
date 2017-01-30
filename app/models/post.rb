class Post < ActiveRecord::Base

  has_many :ratings
  belongs_to :user


  def formatted_content
    if content.split.size > 4
      content.split.take(4).join(" ") + "..."
    else
      content
    end
  end

  def average_rating
    return 0 if ratings.empty?
    ratings.map(&:score).inject(:+) / ratings.count.to_f
  end

end
