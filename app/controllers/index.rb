require 'pony'

get '/' do
  if current_user
    if has_playlist?(session[:user_id]) == true
      redirect '/dashboard'
    else
      user = User.find(session[:user_id])
      user.notifications.create(:content => "Connect with SoundCloud!", :link => '/connect_to_soundcloud')
      redirect '/connect_to_soundcloud'
    end
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