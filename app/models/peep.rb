require 'dm-core'
require 'dm-validations'

class Peep
	include DataMapper::Resource

	belongs_to :user

	property :id, Serial
	property :peep, Text, :required => true, :message => 'You cannot submit an empty peep'

end