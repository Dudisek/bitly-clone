get '/' do
	@urls = Url.all
  erb :"static/index"
end

post '/urls' do
	puts "[LOG:] Creating ID"
	@url = Url.create(long_url: params[:input_long_url])
	redirect "/"
end

post '/delete' do
	puts "[LOG:] Deleteing ID"
	Url.destroy(params[:write_id])
	redirect "/"
end

get '/contact' do
  erb :"static/contact"
end

get '/:short_url' do
	url = Url.find_by(short_url: params[:short_url])
	
	unless url.nil?
		url.counter = url.counter + 1	
		url.save	
		redirect url.long_url
	else
		redirect "/"
	end
end

