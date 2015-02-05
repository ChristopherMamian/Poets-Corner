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
    @user_stories = @user.stories
    erb :dashboard
  else
    erb :login
  end
end