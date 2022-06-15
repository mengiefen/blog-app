require 'rails_helper'

# I can see the username and password inputs and the "Submit" button.
# When I click the submit button without filling in the username and the password, I get a detailed error.
# When I click the submit button after filling in the username and the password with incorrect data, I get a detailed error.
# When I click the submit button after filling in the username and the password with correct data, I am redirected to the root page.

RSpec.describe 'LoginPage', type: :system do
  context 'testing' do
    it 'username should render correctly' do
      visit new_user_session_path
      expect(page).to have_content 'Log in'
    end

    it 'shows a detailed error when I click the submit button without filling in the username and the password' do
        visit new_user_session_path
        click_link 'Log in'
        expect(flash[:alert]).to have_content 'Invalid Email or password.'
    end
  end
end