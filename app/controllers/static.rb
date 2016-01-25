get '/' do

	@urls = Url.order(id: :desc).limit(10)
	@total_url = Url.count
	@total_saved_char = Url.saved_characters
	@total_click = Url.total_click
	erb :"static/index"

end

post '/urls' do
	puts "[LOG:] Creating ID"
	@url = Url.create(long_url: params[:input_long_url])

	{
		string: "<tr>
      <td>#{@url.id}</td>
      <td>#{@url.long_url}</td>
      <td><a href = #{@url.short_url}>#{ENV['APP_URL']}/#{@url.short_url}</a></td>
      <td>Copy</td>
      <td>#{@url.created_at.strftime("%d %b. %Y at %H:%M")}</td>
      <td>#{@url.counter}</td>
   </tr>",
   url: "#{ENV['APP_URL']}/#{@url.short_url}"
	}.to_json

end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	
	if url.nil?
		redirect "/"
	else
		url.count
		redirect url.long_url
	end
end

