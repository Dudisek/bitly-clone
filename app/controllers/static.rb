get '/' do

	@urls = Url.order(id: :desc).limit(10)
	# @total_url = Url.count
	# puts @total_saved_char = Url.saved_characters
	# @total_click = Url.total_click
	erb :"static/index"

end

post '/urls' do
	puts "[LOG:] Creating ID"
	@url = Url.create(long_url: params[:input_long_url])
	# url_shorten_qty = Setting.first.url_shorten_qty + 1
	# Setting.update(url_shorten_qty: url_shorten_qty)

	
	# @urls = Url.all
	# redirect "/"
	# @url.to_json
	# @urls.each do |url|
	{
		string: "<tr>
      <td>#{@url.id}</td>
      <td>#{@url.long_url}</td>
      <td><a href = #{@url.short_url}>#{ENV['APP_URL']}/#{@url.short_url}</a></td>
      <td>Copy</td>
      <td>#{@url.created_at.strftime("%d %b. %Y at %H:%M")}</td>
      <td>#{@url.counter}</td>
   </tr>",
   url: "http://localhost:9393/#{@url.short_url}"
	}.to_json
	  

   



 # end
end


# post '/delete' do
# 	puts "[LOG:] Deleteing ID"
# 	Url.destroy(params[:write_id])
# 	redirect "/"
# end

get '/contact' do
  erb :"static/contact"
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	
	unless url.nil?
		url.count
		redirect url.long_url
	else
		redirect "/"
	end
end

