require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    it 'success for users page' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it "renders 'users#index' template" do
      get users_path
      expect(response).to render_template('index')
    end

    it 'it should return the title' do
      get users_path
      expect(response.body).to include('Blog Website- for Everyone')
    end
  end
  describe 'GET #show' do
    it 'it is success for user page' do
      get user_path(id: 1)
      expect(response).to have_http_status(200)
    end

    it "renders 'users#show' template" do
      get user_path(id: 1)
      expect(response).to render_template('show')
    end

    it 'should have CREATE NEW POST button' do
      get user_path(id: 1)
      expect(response.body).to include('CREATE NEW POST')
    end
  end
end
