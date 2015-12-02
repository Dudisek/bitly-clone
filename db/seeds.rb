require_relative '../config/environments/init'
# require_relative '../app/models/url'
require 'securerandom'

data = []
here = 0 
File.open("urls", "r").each_line do |line|
  # name: "Angela"    job: "Writer"    ...
  data << line.gsub(/[(,)]/i, '').chomp
end


Url.transaction do 
	data.each_with_index do |a, index| 
		b = SecureRandom.hex(3)
		Url.connection.execute "INSERT INTO urls (long_url, short_url, created_at, updated_at) 
		VALUES ('#{data[here]}', '#{b}', '#{Time.now}', '#{Time.now}');"
		p "inserted #{index}" if index % 1000 == 0
		here += 1
	end
end



 # Setting.create(url_shorten_qty: 500207)
