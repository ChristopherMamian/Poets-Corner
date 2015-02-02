get '/stories/new' do
  erb :story_new
end

post '/stories/new' do
  Story.create(params[:story])
  redirect '/dashboard'
end

get '/stories/:story_id' do
  @story = Story.find(params[:story_id])
  erb :story
end