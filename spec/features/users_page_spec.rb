require 'rails_helper'

RSpec.describe User do
  include UserHelper

  it "can sign up" do
    visit signup_path
    fill_in "user_username", with: "Pekka"
    fill_in "user_password", with: "salasana"
    fill_in "user_password_confirmation", with: "salasana"
    expect {
      click_button "Create user"
    }.to change { User.count }.by 1
  end
end
