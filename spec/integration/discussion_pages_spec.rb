describe 'the page that a user sees upon login' do
  it 'has a new discussion field' do
    @user = FactoryGirl.create(:user)
    
    visit root_path
	click_link 'Login'
    
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: 'foobar26?'
    click_button 'Sign in'

    # page.should have_button 'Create new discussion'
  end


end
