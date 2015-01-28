get '/' do
  # let user create new short URL, display a list of shortened URLs
  @url = Url.all
  erb :index
end

post '/urls' do
  # create a new Url
  Url.create(params[:url])
  redirect to ("/#{params[:url][:short]}")
end

# e.g., /q6bda
get '/:short_url' do
  @go_to = Url.where('short = ?', params[:short_url]).first
 p  @go_to.click_count
  @go_to.update_attributes( click_count: @go_to.click_count += 1 )
  redirect to ( @go_to.original )

  # redirect to appropriate "long" URL
end
