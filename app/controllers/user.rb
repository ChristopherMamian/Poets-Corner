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
    redirect '/'
  else
    erb :error, :locals => {:message => "Oopse! One of the fields is missing! Please try to sign up again." }
  end
end