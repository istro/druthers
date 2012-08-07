describe 'the page that a user sees upon login' do
  it 'has a new poll field' do
    FactoryGirl.create :user
    
    visit root_path
	click_link 'Login'
    
    fill_in 'Email', with: 'test@example.com'
    fill_in 'Password', with: 'foobar123!'
    click_button 'Sign in'

    # save_and_open_page
    page.should have_button 'Create new poll'
  end
end
