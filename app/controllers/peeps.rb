post '/new_peep' do
	@peep = current_user.peeps.create!(peep: params[:peep])
  if !@peep.peep.empty?
  	redirect to('/')
  else
    flash[:notice] = 'You cannot submit an empty peep'
  	redirect to('/')
  end
end