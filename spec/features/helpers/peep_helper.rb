module PeepHelper
	def add_peep(text)
		visit '/'
		fill_in 'peep', with: text
		click_button 'Post!'
	end
end