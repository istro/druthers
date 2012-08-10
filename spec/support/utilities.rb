def create_user_and_sign_in
  @user = FactoryGirl.create(:user)
  visit root_path
  click_link 'Login'
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: 'password'
  click_button 'Sign in'
end
