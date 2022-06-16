require 'rails_helper'

RSpec.describe 'posts_show_page', type: :system do
  before :all do
    @user1 = User.create!(id: 1, name: 'Babi', photo: 'https://randomuser.me/api/portraits/men/3.jpg',
                          bio: 'I used to spend hours writing creative copy', email: 'b@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @user2 = User.create!(id: 2, name: 'Jhon', photo: 'https://randomuser.me/api/portraits/men/4.jpg',
                          bio: 'Condimentum mattis pellentesque id nibh tortor.', email: 'a@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @user3 = User.create!(id: 3, name: 'Alemayehu', photo: 'https://randomuser.me/api/portraits/men/5.jpg',
                          bio: 'Condimentum mattis pellentesque id nibh tortor.', email: 'al@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @post1 = Post.create!(author_id: 1, title: 'Sample post1', text: 'Sample Text Content 1')
    @post2 = Post.create!(author_id: 1, title: 'Sample post2', text: 'Sample Text Content 2')
    @post3 = Post.create!(author_id: 1, title: 'Sample post3', text: 'Sample Text Content 3')
    @post4 = Post.create!(author_id: 1, title: 'Sample post3', text: 'Sample Text Content 3')
    @post5 = Post.create!(author_id: 2, title: 'Sample post4', text: 'Sample Text Content 4')
    @post6 = Post.create!(author_id: 2, title: 'Sample post4', text: 'Sample Text Content 1')
    @post7 = Post.create!(author_id: 1, title: 'Sample post2', text: 'Sample Text Content 2')
    @post8 = Post.create!(author_id: 3, title: 'Sample post3', text: 'Sample Text Content 3')
    @post9 = Post.create!(author_id: 3, title: 'Sample post4', text: 'Sample Text Content 4')

    @comment1 = Comment.create!(author_id: 1, post_id: 1, text: 'Comment-1')
    @comment1 = Comment.create!(author_id: 2, post_id: 1, text: 'Comment-1')
    @comment1 = Comment.create!(author_id: 3, post_id: 1, text: 'Comment-1')

    @like1 = Like.create!(author_id: 1, post_id: 1)
    @like1 = Like.create!(author_id: 2, post_id: 1)
    @like1 = Like.create!(author_id: 3, post_id: 1)
  end

  context 'testing post#show' do
    before :each do
      visit root_path
      fill_in 'user_email', with: 'a@g.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      visit user_post_path(user_id: @user1.id, id: @post1.id)
    end

    it 'I can see the post title' do
      expect(page).to have_content 'Sample Post1'
    end

    it 'I can see who wrote the post.' do
      expect(page).to have_content @user1.name
    end
    it 'I can see how many comments it has.' do
      expect(page).to have_content '1'
    end

    it 'I can see how many likes it has.' do
      expect(page).to have_content '1'
    end

    it 'I can see the post body.' do
      expect(page).to have_content @post1.text
    end

    it 'I can see the username of each commentor.' do
      expect(page).to have_content 'Babi'
    end

    it 'I can see the comment each commentor left.' do
      expect(page).to have_content @comment1.text
    end
  end
end
