require 'securerandom'


class Url < ActiveRecord::Base


	before_create :shorten
	validates :long_url, format: URI::regexp(%w(http https))


	def shorten
		 self.short_url = SecureRandom.hex(3)
	end

	def count
		self.counter += 1
		self.save
	end

	def self.total_click
		puts "[LOG]: TOTAL CLICK:"
		total_click = 0
		array_of_click = Url.select(:counter)
		array_of_click.each do |a| 
			total_click += a.counter
		end
		total_click
	end

	def self.saved_characters
			total_long = 0
			total_short = 0
			array_short = Url.select(:short_url)
			array_long = Url.select(:long_url)
			puts "[LOG] SHORT URL"
			array_short.each do |a| total_short += "#{APP_ROOT}".length + a.short_url.length end
			array_long.each do |a| total_long += a.long_url.length end
			total = total_long - total_short
	end
	# def add_http
	#   uri =~ %r(https?://) ? uri : "http://#{uri}"
	# end
end




