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

delete '/stories/:story_id/delete' do
  Story.find(params[:story_id]).delete
  redirect '/dashboard'
end