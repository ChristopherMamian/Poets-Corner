get '/stories/:story_id/chapters/new' do
  @story = Story.find(params[:story_id])
  erb :'chapter/chapter_new'
end

post '/stories/:story_id/chapters/new' do
  story = Story.find(params[:story_id])
  story.chapters.create(params[:chapter])
  user = User.find(story.user_id)
  user_friends = user.friends
  user_friends.each do |friend|
    friend.notifications.create(:content => "#{user.name} wrote a new chapter for #{story.title}!", :link => "/stories/#{story.id}/public")
  end
  redirect "/stories/#{story.id}"
end

get '/stories/:story_id/chapters/:chapter_id' do
  @story = Story.find(params[:story_id])
  @chapter = Chapter.find(params[:chapter_id])
  erb :'chapter/chapter'
end

get '/stories/:story_id/chapters/:chapter_id/public' do
  @story = Story.find(params[:story_id])
  @chapter = Chapter.find(params[:chapter_id])
  erb :'chapter/chapter_public'
end

delete '/stories/:story_id/chapters/:chapter_id/delete' do
  Chapter.find(params[:chapter_id]).destroy
  redirect "/stories/#{params[:story_id]}"
end

get '/stories/:story_id/chapters/:chapter_id/edit' do
  @story = Story.find(params[:story_id])
  @chapter = Chapter.find(params[:chapter_id])
  erb :'chapter/chapter_edit'
end

put '/stories/:story_id/chapters/:chapter_id/edit' do
  chapter = Chapter.find(params[:chapter_id])
  chapter.update_attributes(params[:chapter])
  redirect "/stories/#{params[:story_id]}/chapters/#{params[:chapter_id]}"
end