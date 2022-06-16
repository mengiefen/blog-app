require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    @user = @user1 = User.create!(id: 11_111, name: 'Babi', photo: 'https://randomuser.me/api/portraits/men/3.jpg',
                                  bio: 'I used to spend hours writing creative copy',
                                  email: 'b@g.com', password: '123456',
                                  created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    Post.new(author: @user, title: 'Title', text: 'Post content')
  end

  before { subject.save }

  describe 'validates' do
    it 'title must not be blank' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'title must not exceed 250 characters' do
      subject.title = 'Nam quis nulla. Integer malesuada.
      In in enim a arcu imperdiet malesuada. Sed vel lectus.
      Donec odio urna, tempus molestie, porttitor ut,
      iaculis quis, sem. Phasellus rhoncus. Aenean id
      metus id velit ullamcorper pulvinar. Vestibulum
      fermentum tortor id mi. Pellentesque ipsum. Nulla non arcu lacinia'
      expect(subject).to_not be_valid
    end

    it 'CommentsCounter must be an integer greater than or equal to zero.' do
      subject.comments_counter = - 1
      expect(subject).to_not be_valid
    end

    it 'LikesCounter must be an integer greater than or equal to zero.' do
      subject.likes_counter = - 1
      expect(subject).to_not be_valid
    end
  end

  describe '#methods' do
    it 'it increments to 2' do
      subject.increment_post_count
      expect(subject.author.posts_counter).to eq 2
    end

    it 'it decrements to 0' do
      subject.decrement_post_count
      expect(subject.author.posts_counter).to eq(0)
    end
  end
end
