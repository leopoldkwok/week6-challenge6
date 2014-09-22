require 'spec_helper'

require_relative 'helpers/user_helpers'
require_relative 'helpers/peep_helper'

include UserHelper
include PeepHelper

feature 'User signs up' do

	scenario 'when being logged out' do
		visit '/'
		expect(lambda {sign_up}).to change(User, :count).by(1)
		expect(page).to have_content("Welcome Batmanlives")
		expect(User.first.email).to eq("batman@gmail.com")
	end

	scenario 'with a password that doesn\'t match' do
		expect(lambda { sign_up('a@a.com', 'aaa', 'bbb' 'password', 'wrongggg')}).to change(User, :count).by(0)
		expect(current_path).to eq('/sign_up')
		expect(page).to have_content('Your passwords don\'t match')
	end

	scenario 'with an email that is already registered' do
		expect(lambda { sign_up }).to change(User, :count).by(1)
		expect(lambda { sign_up }).to change(User, :count).by(0)
		expect(page).to have_content("This email is already taken")
	end


end

feature 'User signs in' do

	before(:each) do
		User.create(:email => 'test@test.com',
								:name => 'test',
								:username => 'testtt',
								:password => 'testfirst!',
								:password_confirmation => 'testfirst!')
							
	end

	scenario 'with correct credentials' do
		visit '/'
		expect(page).not_to have_content("Welcome, testtt")
		sign_in('test@test.com', 'testfirst!')
		expect(page).to have_content("Welcome testtt")
	end

	scenario 'with incorrect credentials' do
		visit '/'
		expect(page).not_to have_content("Welcome, testtt")
		sign_in('test@test.com', 'wrong!!!!')
		expect(page).not_to have_content("Welcome testtt")
		expect(page).to have_content("The email or password are incorrect")
	end
end

feature 'User signs out' do
	before(:each) do
		User.create(:email => 'test@test.com',
								:name => 'test',
								:username => 'testtt',
								:password => 'testfirst!',
								:password_confirmation => 'testfirst!')
	end

	scenario 'while being signed in' do
		sign_in('test@test.com', 'testfirst!')
		click_button "Sign out"
		expect(page).to have_content("Good bye!")
		expect(page).not_to have_content("Welcome, testtt")
	end

	scenario 'and posts a peep' do
		sign_up(email = 'batman@gmail.com',
							name = 'Batman',
							username = 'Batmanlives',
					    password='forever')
		visit '/'
		add_peep('I am the dark knight')
		expect(page).to have_content('posted by Batmanlives')		
	end

end