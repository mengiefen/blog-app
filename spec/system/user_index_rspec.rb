require 'rails_helper'

RSpec.describe 'UserIndexPage', type: :system do
  before :all do
    @user1 = User.create!(
      name: 'Babi Melka',
      photo: 'https://randomuser.me/api/portraits/men/3.jpg',
      bio: 'I used to spend hours writing creative copy',
      email: 'b@g.com',
      password: '123456',
      created_at: '2022-06-15 06:29:35.011315',
      confirmed_at: '2022-06-15 18:08:24.835529'
    )

    @user2 = User.create!(
      name: 'Arun Tata',
      photo: 'https://randomuser.me/api/portraits/men/4.jpg',
      bio: 'Condimentum mattis pellentesque id nibh tortor.',
      email: 'a@g.com',
      password: '123456',
      created_at: '2022-06-15 06:29:35.011315',
      confirmed_at: '2022-06-15 18:08:24.835529'
    )

    @user3 = User.create!(
      name: 'Alemayehu Libero',
      photo: 'https://randomuser.me/api/portraits/men/5.jpg',
      bio: 'Condimentum mattis pellentesque id nibh tortor.',
      email: 'al@g.com',
      password: '123456',
      created_at: '2022-06-15 06:29:35.011315',
      confirmed_at: '2022-06-15 18:08:24.835529'
    )
  end

  context 'testing' do
    before :each do
      visit root_path
      fill_in 'user_email', with: 'a@g.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
    end

    it 'shows the username of all other users' do
      expect(page).to have_content(@user1.name)
      expect(page).to have_content(@user2.name)
    end

    it 'shows the profile picture for each user' do
      expect(page.has_xpath?("//img[@src = '#{@user1.photo}' ]"))
      expect(page.has_xpath?("//img[@src = '#{@user2.photo}' ]"))
    end

    it 'shows the number of posts each user has written' do
      expect(page).to have_content('Number of Posts: 0')
    end

    it 'redirects to a user\'s show page, when that user is clicked upon' do
      all('.btn-primary').first.click
      expect(page).to have_current_path(user_path(id: @user1.id))
    end
  end
end
