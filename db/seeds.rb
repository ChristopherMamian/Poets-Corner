require 'faker'
5.times do
  user = User.create(:name => Faker::Name.name, :email => Faker::Internet.email, :password => "quill")
  5.times do
    user.stories.create(:title => Faker::Lorem.word, :genre => Faker::Commerce.department)
    story = user.stories.last
    5.times do
      story.chapters.create(:title => Faker::Commerce.color, :content => Faker::Lorem.sentence)
      chapter = story.chapters.last
      5.times do
        chapter.comments.create(:content => Faker::Lorem.sentence, :user_id => rand(1..5))
      end
    end
  end
end