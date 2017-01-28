class Post < ActiveRecord::Base

  has_many :ratings

  def formatted_content
    if content.split.size > 4
      content.split.take(4).join(" ") + "..."
    else
      content
    end
  end

end
