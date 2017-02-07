module UserHelper

  def sign_in(user_params)
    visit login_path
    fill_in "username", with: user_params[:username]
    fill_in "password", with: user_params[:password]
    click_button "Sign in"
  end

end
