####GO HERE FIRST ###
get '/connect_to_soundcloud' do
  erb :soundcloud_start
end

get '/soundcloud' do
  client = Soundcloud.new(:client_id => ENV["CLIENT_ID"],
                        :client_secret => ENV["CLIENT_SECRET"],
                        :redirect_uri => 'http://localhost:9393/authentication')
  redirect client.authorize_url
end

get '/authentication' do
   client = Soundcloud.new(:client_id => ENV["CLIENT_ID"],
                        :client_secret => ENV["CLIENT_SECRET"],
                        :redirect_uri => 'http://localhost:9393/authentication')
  code = params[:code]
  user_access_token = client.exchange_token(:code => code)
  user = User.find(session[:user_id])
  user.update_attributes(:access_token => user_access_token.access_token)
  redirect '/soundcloud/get_user_playlist'
end

###THEN GO HERE ##
get '/soundcloud/get_user_playlist' do
  user = User.find(session[:user_id])
# create client object with access token
  client = Soundcloud.new(:access_token => user.access_token)

# make an authenticated call
  current_user = client.get('/me')
  playlist = client.get('/me/playlists')
  playlist_uri = ""
  playlist.each do |pl_hash|
    if playlist.first.title == "StoryBook"
     playlist_uri = pl_hash.uri
    end
  end
  user.update_attributes(:playlist => playlist_uri)
  redirect '/dashboard'
end