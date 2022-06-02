require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/12/posts' }

    it 'it is success' do
      expect(response).to have_http_status(200)
    end

    it "renders 'posts#index' template" do
      expect(response).to render_template('index')
    end

    it "should respond with body placeholder 'Here is a list of posts for a given user'" do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/12/posts/1' }

    it 'it is success' do
      expect(response).to have_http_status(200)
    end

    it "renders 'posts#show' template" do
      expect(response).to render_template('show')
    end

    it "should respond with body placeholder 'Here is a specific post for a given user'" do
      expect(response.body).to include('Here is a specific post for a given user')
    end
  end
end
