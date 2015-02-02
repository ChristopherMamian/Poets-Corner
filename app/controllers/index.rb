get '/' do
  redirect '/dashboard'
end

get '/dashboard' do
  @stories = Story.all
  erb :dashboard
end