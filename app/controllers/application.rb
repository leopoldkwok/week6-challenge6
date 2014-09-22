get '/' do
	@peeps = Peep.all
	erb :index, :layout => :layout
end