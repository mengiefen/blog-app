require 'rails_helper'

RSpec.describe 'UserShowPage', type: :system do
  before :all do
    @user1 = User.create!(name: 'Babi', photo: 'https://randomuser.me/api/portraits/men/3.jpg',
                          bio: 'I used to spend hours writing creative copy', email: 'b@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @user2 = User.create!(name: 'Jhon', photo: 'https://randomuser.me/api/portraits/men/4.jpg',
                          bio: 'Condimentum mattis pellentesque id nibh tortor.', email: 'a@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @user3 = User.create!(name: 'Alemayehu', photo: 'https://randomuser.me/api/portraits/men/5.jpg',
                          bio: 'Condimentum mattis pellentesque id nibh tortor.', email: 'al@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @post1 = Post.create!(author_id: 1, title: 'Sample post1', text: 'Sample Text Content 1')
    @post2 = Post.create!(author_id: 1, title: 'Sample post2', text: 'Sample Text Content 2')
    @post3 = Post.create!(author_id: 1, title: 'Sample post3', text: 'Sample Text Content 3')
    @post4 = Post.create!(author_id: 1, title: 'Sample post3', text: 'Sample Text Content 3')
    @post5 = Post.create!(author_id: 2, title: 'Sample post4', text: 'Sample Text Content 4')
    @post6 = Post.create!(author_id: 2, title: 'Sample post1', text: 'Sample Text Content 1')
    @post7 = Post.create!(author_id: 1, title: 'Sample post2', text: 'Sample Text Content 2')
    @post8 = Post.create!(author_id: 3, title: 'Sample post3', text: 'Sample Text Content 3')
    @post9 = Post.create!(author_id: 3, title: 'Sample post4', text: 'Sample Text Content 4')
  end

  context 'testing' do
    before :each do
      visit root_path
      fill_in 'user_email', with: 'a@g.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit user_path(id: @user1.id)
    end

    it 'Shows the user\'s profile picture' do
      expect(page.has_xpath?("//img[@src = '#{@user1.photo}' ]"))
    end

    it 'Shows the user\'s username' do
      expect(page).to have_content @user1.name
    end

    it 'Shows the the number of posts the user has written' do
      expect(page).to have_content('Number of Posts: 5')
    end
    it 'Shows the user\'s bio' do
      expect(page).to have_content @user1.bio
    end

    it 'Shows the user\'s first 3 posts' do
      expect(page).to have_selector('.card', count: 5)
    end

    it 'Shows a button that lets me view all of a user\'s posts' do
      expect(page).to have_button('See All Posts')
    end
  end
end
