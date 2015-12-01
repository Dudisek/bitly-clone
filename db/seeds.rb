require_relative '../config/environments/init'
require_relative '../app/models/url'
require 'securerandom'

data = []

File.open("urls", "r").each_line do |line|
  # name: "Angela"    job: "Writer"    ...
  data << line.gsub(/[(,)]/i, '').chomp
end

# puts data
Url.transaction do 
 # ActiveRecord::Base.connection.execute
	data.each_with_index do |a, index| 
		b = SecureRandom.hex(3)
		Url.connection.execute "INSERT INTO urls (long_url, short_url, created_at, updated_at) VALUES ('#{data.first}', '#{b}', '#{Time.now}', '#{Time.now}');"
		p "inserted #{index}" if index % 1000 == 0
	end
end

	#{long_url} VALUES #{a}"

	# INSERT INTO films (code, title, did, date_prod, kind) VALUES
 #    ('B6717', 'Tampopo', 110, '1985-02-10', 'Comedy'),
 #    ('HG120', 'The Dinner Game', 140, DEFAULT, 'Comedy');