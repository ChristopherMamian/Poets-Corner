get '/stories/new' do
  erb :'story/story_new'
end

post '/stories/new' do
  user = User.find(session[:user_id])
  user.stories.create(params[:story])
  redirect '/dashboard'
end

get '/stories/:story_id' do
  @story = Story.find(params[:story_id])
  erb :'story/story'
end

delete '/stories/:story_id/delete' do
  Story.find(params[:story_id]).delete
  redirect '/dashboard'
end

get '/stories/:story_id/edit' do
  @story = Story.find(params[:story_id])
  erb :'story/story_edit'
end

put '/stories/:story_id/edit' do
  story = Story.find(params[:story_id])
  story.update_attributes(params[:story])
  redirect "/stories/#{story.id}"
end