get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do
	@url = Url.create(long_url: params[:input_long_url])
	# url.short_url = url.shorten
	# url.save
	redirect "/"
end

post '/delete' do
	Url.destroy(params[:write_id])
	redirect "/"
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	redirect url.long_url
end