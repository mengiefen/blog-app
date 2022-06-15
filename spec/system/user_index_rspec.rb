require 'rails_helper'

RSpec.describe 'UserIndexPage', type: :system do
  before do
    # @user_1 = User.create!(
    #   name: 'Babi Melka',
    #   photo: 'https://randomuser.me/api/portraits/men/3.jpg',
    #   bio: 'I used to spend hours writing creative copy',
    #   email: 'b@g.com',
    #   password: '123456',
    #   created_at: '2022-06-15 06:29:35.011315',
    #   confirmed_at: '2022-06-15 18:08:24.835529'
    # )

    # @user_2 = User.create(
    #   name: 'Arun Tata',
    #   photo: 'https://randomuser.me/api/portraits/men/4.jpg',
    #   bio: 'Condimentum mattis pellentesque id nibh tortor.',
    #   email: 'a@g.com',
    #   password: '123456',
    #   created_at: '2022-06-15 06:29:35.011315',
    #   confirmed_at: '2022-06-15 18:08:24.835529'
    # )

    # @user_3 = User.create(
    #   name: 'Alemayehu Libero',
    #   photo: 'https://randomuser.me/api/portraits/men/5.jpg',
    #   bio: 'Condimentum mattis pellentesque id nibh tortor.',
    #   email: 'al@g.com',
    #   password: '123456',
    #   created_at: '2022-06-15 06:29:35.011315',
    #   confirmed_at: '2022-06-15 18:08:24.835529'
    # )
  end

  context 'testing' do
    it 'shows the username of all other users' do
      # visit root_path
      # fill_in 'Email', with: 'al@g.com'
      # fill_in 'Password', with: '123456'
      # click_button 'Log in'
      visit users_path
      expect(page).to have_content @user_1.name
    end

    # it 'shows the profile picture for each user' do
    # end

    # it 'shows the number of posts each user has written' do
    # end

    # it 'redirects to a user\'s show page, when that user is clicked upon' do
    # end
  end
end
