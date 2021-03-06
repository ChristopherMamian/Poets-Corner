get '/stories/new' do
  erb :'story/story_new'
end


post '/stories/new' do
  user = User.find(session[:user_id])
  user_friends = user.friends
  user.stories.create(params[:story])
  user_friends.each do |friend|
    friend.notifications.create(:content => "#{user.name} started a new story!", :link => "/users/#{user.id}")
  end
  redirect '/dashboard'
end

get '/stories/:story_id/public' do
  @story = Story.find(params[:story_id])
  erb :'story/story_public'
end

get '/stories/:story_id' do
  @story = Story.find(params[:story_id])
  erb :'story/story'
end

get '/stories/:story_id/public/find_chapter' do
  chapter_id = params[:chapter]
  redirect "/stories/#{params[:story_id]}/chapters/#{chapter_id}/public"
end

delete '/stories/:story_id/delete' do
  Story.find(params[:story_id]).destroy
  redirect '/dashboard'
end

get '/stories/:story_id/edit' do
  @story = Story.find(params[:story_id])
  erb :'story/story_edit'
end

put '/stories/:story_id/edit' do
  story = Story.find(params[:story_id])
  story.update_attributes(params[:story])
  if params[:chapter_to_delete]
    Chapter.find(params[:chapter_to_delete].to_i).destroy
  end
  redirect "/stories/#{story.id}"
end