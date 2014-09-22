require 'spec_helper'
require_relative 'helpers/user_helpers'
require_relative 'helpers/peep_helper'

include UserHelper
include PeepHelper

feature 'User adds a new post' do
	before(:each) do
		User.create(:email => 'test@test.com',
								:name => 'test',
								:username => 'test99',
								:password => '123',
								:password_confirmation => '123')
	end

	

	scenario 'when logged in and browsing the homepage' do
		expect(Peep.count).to eq(0)
		sign_in('test@test.com', '123')
		add_peep('some text')
		expect(Peep.count).to eq(1)
		post = Peep.first
		expect(post.peep).to eq('some text')
	end


	scenario 'and it appears on the page' do
		sign_in('test@test.com', '123')
		add_peep('This is a test')
		expect(page).to have_content('This is a test')
	end
end