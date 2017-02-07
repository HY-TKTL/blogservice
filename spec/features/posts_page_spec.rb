require 'rails_helper'

RSpec.describe Post do

  include UserHelper

  describe "when not logged in" do
    before :each do
      FactoryGirl.create_list :post, 3
    end

    it "can list posts" do
      visit posts_path
      expect(page).to have_content "Example title 1"
      expect(page).to have_content Post.first.formatted_content
    end
  end

  describe "when logged in" do

    before :each do
      user = FactoryGirl.create :user
      sign_in username: user.username, password: "goodpassword"
    end

    it "can create a new post" do
      visit new_post_path
      fill_in "Title", with: "Good post"
      fill_in "Content", with: "Good content"
      expect { click_button "Create Post" }.to change { Post.count }.by 1
    end
  end
end
