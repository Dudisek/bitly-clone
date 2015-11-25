# require_relative "app/models/url"
require_relative 'config/environments/init'

puts Url.shorten
# puts Url.create
# p Url.create(:long_url => "https://github.com/stympy/faker")
puts Url.all