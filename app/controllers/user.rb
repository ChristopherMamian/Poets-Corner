post '/login' do
  if User.find_by_email_and_password(params[:email], params[:password])
    @user = User.find_by_email_and_password(params[:email], params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :error, :locals => {:message => "We don't have that email and password combo in our system."}
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/'
end

get '/users/new' do
  erb :signup
end

post '/users/new' do
  user = User.new(params[:user])
  if user.save
    @user = User.find_by(:email => params[:user][:email])
    session[:user_id] = @user.id
    redirect '/dashboard'
  else
    erb :error, :locals => {:message => "Oopse! One of the fields is missing! Please try to sign up again." }
  end
end

get '/users/:user_id/edit' do
  @user = User.find(params[:user_id])
  erb :'user/user_edit'
end

put '/users/:user_id/edit' do
  user = User.find(params[:user_id])
  user.update_attributes(params[:user])
  redirect '/'
end

get '/users/:user_id/delete' do
  Story.where(:user_id => params[:user_id]).delete
  User.find(params[:user_id]).delete
  redirect '/logout'
end

get '/users/:user_id' do
  @user = User.find(params[:user_id])
  erb :'user/user_public'
end
