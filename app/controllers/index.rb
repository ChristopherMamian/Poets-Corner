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
    @stories = Story.all
    erb :dashboard
  else
    erb :login
  end
end