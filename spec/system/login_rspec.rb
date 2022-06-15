# require 'rails_helper'

# RSpec.describe 'LoginPage', type: :system do
#   before :all do
#     @user_1 = User.create!(
#       name: 'Babi Melka',
#       photo: 'https://randomuser.me/api/portraits/men/3.jpg',
#       bio: 'I used to spend hours writing creative copy',
#       email: 'b@g.com',
#       password: '123456',
#       created_at: '2022-06-15 06:29:35.011315',
#       confirmed_at: '2022-06-15 18:08:24.835529'
#     )

#     @user_2 = User.create!(
#       name: 'Arun Tata',
#       photo: 'https://randomuser.me/api/portraits/men/4.jpg',
#       bio: 'Condimentum mattis pellentesque id nibh tortor.',
#       email: 'a@g.com',
#       password: '123456',
#       created_at: '2022-06-15 06:29:35.011315',
#       confirmed_at: '2022-06-15 18:08:24.835529'
#     )
#     @user_3 = User.create!(
#       name: 'Alemayehu Libero',
#       photo: 'https://randomuser.me/api/portraits/men/5.jpg',
#       bio: 'Condimentum mattis pellentesque id nibh tortor.',
#       email: 'al@g.com',
#       password: '123456',
#       created_at: '2022-06-15 06:29:35.011315',
#       confirmed_at: '2022-06-15 18:08:24.835529'
#     )
#   end
#   context 'testing' do
#     it 'username should render correctly' do
#       visit new_user_session_path
#       expect(page).to have_content 'Log in'
#     end

#     it 'shows a detailed error when I click the submit button without
#         filling in the username and the password' do
#       visit root_path
#       fill_in 'Email', with: ''
#       fill_in 'Password', with: ''
#       click_button 'Log in'
#       expect(page).to have_content('Invalid Email or password.')
#     end

#     it 'shows a detailed error when I click the submit button after
#         filling in the username and the password with incorrect data' do
#       visit root_path
#       fill_in 'Email', with: 'asdf'
#       fill_in 'Password', with: 'asdf'
#       click_button 'Log in'
#       expect(page).to have_content('You need to sign in or sign up before continuing.')
#     end

#     it 'Redirects me to the root page when I click the submit button after
#           filling in the username and the password with correct data,
#               I am redirected to the root page' do
#       visit root_path
#       fill_in 'Email', with: 'al@g.com'
#       fill_in 'Password', with: '123456'
#       click_button 'Log in'
#       expect(page).to have_current_path(user_session_path)
#     end
#   end
# end
