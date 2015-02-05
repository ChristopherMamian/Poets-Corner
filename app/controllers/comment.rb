get '/stories/:story_id/chapters/:chapter_id/comments/new' do
  @story = Story.find(params[:story_id])
  @chapter = Chapter.find(params[:chapter_id])
  erb :comment_new
end

post '/stories/:story_id/chapters/:chapter_id/comments/new' do
  chapter = Chapter.find(params[:chapter_id])
  chapter.comments.create(params[:comment])
  redirect "/stories/#{params[:story_id]}/chapters/#{chapter.id}"
end

get '/stories/:story_id/chapters/:chapter_id/comments/:comment_id' do
  @story = Story.find(params[:story_id])
  @chapter = Chapter.find(params[:chapter_id])
  @comment = Comment.find(params[:comment_id])
  erb :comment
end

delete '/stories/:story_id/chapters/:chapter_id/comments/:comment_id/delete' do
  Comment.find(params[:comment_id]).delete
  redirect "/stories/#{params[:story_id]}/chapters/#{params[:chapter_id]}"
end