require 'pony'

get '/' do
  if current_user
    redirect '/dashboard'
  else
    erb :login
  end
end

get '/dashboard' do
  if current_user
    @user = User.find(session[:user_id])
    @users = User.all
    @friends = @user.friends
    @user_stories = @user.stories
    @notifications = Notification.where(:user_id => session[:user_id])
    erb :dashboard
  else
    erb :login
  end
end

# ################# SOUND CLOUD STUFF ####################
# https://developers.soundcloud.com/docs/api/guide#authentication

# get '/sound_cloud' do
#  client = Soundcloud.new(:client_id => 'bd9504eb4aeecb6687a328cb1c120f85',
#                         :client_secret => 'bd9504eb4aeecb6687a328cb1c120f85',
#                         :redirect_uri => 'http://localhost:9393/authentication')
#  code = params[:code]
#   user_access_token = client.exchange_token(:code => code)
#   user = User.find(session[:user_id])
#   user.update_attributes(:access_token => user_access_token)
# end

# get '/authentication' do
#   "omg hi"

# end

# get '/sound_cloud_request' do
#   user = User.find(session[:user_id])
#   client = Soundcloud.new(:access_token => user.access_token)
#   current_user = client.get('/me')
#   p current_user.username

# end
