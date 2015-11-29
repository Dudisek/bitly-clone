require 'securerandom'


class Url < ActiveRecord::Base

	attr_accessor :long_ur
	before_create :shorten
	validates_format_of :long_url, :with => URI::regexp(%w(http https))

	def shorten
		 self.short_url = SecureRandom.hex(3)
	end

	def count
		self.counter += 1
		self.save
	end





end




