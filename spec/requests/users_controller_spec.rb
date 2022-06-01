require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }
    it 'it is success' do
      expect(response).to have_http_status(200)
    end

    it "renders 'users#index' template" do
      expect(response).to render_template('index')
    end

    it "should respond with body placeholder 'Here is a list of users in the blog-app" do
      expect(response.body).to include('Here is a list of users in the blog-app')
    end
  end
  describe 'GET #show' do
    before(:example) { get '/users/12' }
    it 'it is success' do
      expect(response).to have_http_status(200)
    end

    it "renders 'users#show' template" do
      expect(response).to render_template('show')
    end

    it "should respond with body placeholder 'Here is a detail of a single user" do
      expect(response.body).to include('Here is a detail of a single user')
    end
  end
end
