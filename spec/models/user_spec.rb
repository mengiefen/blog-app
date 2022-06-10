require 'rails_helper'

RSpec.describe User, type: :model do
  before do
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
