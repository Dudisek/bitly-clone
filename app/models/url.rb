require 'securerandom'

class Url < ActiveRecord::Base
	before_create :shorten
	# This is Sinatra! Remember to create a migration!
	def shorten
		# self.short_url = SecureRandom.hex(3)
		 self.short_url = SecureRandom.hex(3)
	end
end
