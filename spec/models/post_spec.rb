require 'rails_helper'

RSpec.describe Post, type: :model do


  it "formatted_content formats text correctly" do
    post = FactoryGirl.create :post, content: "This is a really good content"
    expect(post.formatted_content).to eq "This is a really..."
  end

  it "cannot create two posts with same title" do
    FactoryGirl.create :post, title: "Great"
    post = Post.new title: "Great", content: "Really great stuff"
    expect(post).not_to be_valid
  end

  it "can calculate average rating" do
    post = FactoryGirl.create :post, :with_ratings
    expect(post.average_rating).to be_within(0.1).of 5
  end

  it "saves valid post" do
    FactoryGirl.create :post
    expect(Post.count).to eq 1
  end
end
