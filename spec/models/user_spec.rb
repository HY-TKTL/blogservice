require 'rails_helper'

RSpec.describe User, type: :model do

  describe "without an existing user" do

    it "cant save a user with different password and password_confirmation" do
      user = FactoryGirl.build :user, password: "ok", password_confirmation: "ei ok"
      expect(user).not_to be_valid
    end

  end

  describe "with an existing user" do

    before :each do
      FactoryGirl.create :user
    end

    it "cant save two users with same username" do
      user = FactoryGirl.build :user, username: User.first.username
      expect(user).not_to be_valid
    end
  end
end
