10.times do
  user = User.create!(username: Faker::Name.name, password_digest: "test", email: Faker::Internet.email, location: Faker::Address.city, age: rand(15..99), bio: Faker::Lorem.paragraph, avatar: 'fuckit', date: Time.now)
  question = Question.create!(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(2), posted_at: Faker::Date.backward(14), user_id: user.id)
  answer = Answer.create!(content: Faker::Lorem.paragraph(1), user_id: user.id, question_id: question.id, posted_at: Faker::Date.backward(14), best: false)
  tag = Tag.create!(word: Faker::Lorem.word)
  QuestionTags.create!(tag_id: tag.id, question_id: question.id)
end

10.times do
  tag_type = ['question', 'answer'].sample
  vote_type = ['question', 'answer', 'response'].sample
  id = rand(1..10)
  response = Response.create!(content: Faker::Lorem.sentence, posted_at: Faker::Date.backward(14), respondable_id: id, responable_type: tag_type)
  vote = Vote.create!(votable_id: id, votable_type: vote_type)
end
