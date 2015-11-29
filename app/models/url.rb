require 'securerandom'

class Url < ActiveRecord::Base
	before_create :shorten

	def shorten
		 self.short_url = SecureRandom.hex(3)
		 self.counter = 0
	end

end


