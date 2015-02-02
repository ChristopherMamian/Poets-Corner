get '/stories/:story_id/chapters/new' do
	@story = Story.find(params[:story_id])
	erb :chapter_new
end

post '/stories/:story_id/chapters/new' do
	story = Story.find(params[:story_id])
	story.chapters.create(params[:chapter])
	redirect "/stories/#{story.id}"
end

get '/stories/:story_id/chapters/:chapter_id' do
	@story = Story.find(params[:story_id])
	@chapter = Chapter.find(params[:chapter_id])
	erb :chapter
end
