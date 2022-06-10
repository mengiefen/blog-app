require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'get #index' do
    it 'it is success' do
      get user_posts_path(user_id: 1)
      expect(response).to have_http_status(200)
    end

    it 'renders template' do
      get user_posts_path(user_id: 1)
      expect(response).to render_template('index')
    end

    it "should respond with body placeholder 'CREATE NEW POST'" do
      get user_posts_path(user_id: 1)
      expect(response.body).to include('CREATE NEW POST')
    end
  end

  describe 'GET #new' do
    # before(:example) { get '/users/1/posts/4' }

    it 'it is success' do
      get new_user_post_path(user_id: 1, post_id: 3)
      expect(response).to have_http_status(200)
    end

    it 'renders template' do
      get new_user_post_path(user_id: 1, post_id: 3)
      expect(response).to render_template('new')
    end

    it "should respond with body placeholder 'Create New Post'" do
      get new_user_post_path(user_id: 1, post_id: 3)
      expect(response.body).to include('Create New Post')
    end
  end
end
