require 'faker'

5.times do
  story = Story.create(:title => Faker::Lorem.word)
  5.times do
    story.chapters.create(:title => Faker::Commerce.color, :content => Faker::Lorem.sentence)
    chapter = story.chapters.last
    5.times do
      chapter.comments.create(:content => Faker::Lorem.sentence)
    end
  end
end