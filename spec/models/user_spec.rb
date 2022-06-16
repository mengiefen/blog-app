require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user1 = User.create!(id: 11_111, name: 'Babi', photo: 'https://randomuser.me/api/portraits/men/3.jpg',
                          bio: 'I used to spend hours writing creative copy', email: 'b@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @user = User.create(id: 11_111, name: 'John', photo: 'photo_url', bio: "Jhon's biography", posts_counter: 0)
  end

  describe 'validates' do
    it 'name must not be blank' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'PostsCounter must be an integer greater than or equal to zero.' do
      @user.posts_counter = - 1
      expect(@user).to_not be_valid
    end
  end

  describe '#methods' do
    it '<recent_post> should return 3 recent users' do
      @user.posts.each do |post|
        p post
      end
      expect(@user.recent_post).not_to eq nil
    end
  end
end
