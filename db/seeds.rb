# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

USERS = %w[User1 User2 User3].freeze
CATEGORIES = %w[Category1 Category2 Category3].freeze
TESTS = 10
TEST_QUESTIONS = 3

users = USERS.reduce([]) do |res, name|
  res << User.create(name: name)
end

categories = CATEGORIES.reduce([]) do |res, title|
  res << Category.create(title: title)
end

tests = (1..TESTS).reduce([]) do |res, i|
  title = "Test#{i}"
  level = [0, 1, 2, 3].sample
  category_id = categories.sample.id
  author_id = users.sample.id
  res << Test.create(title: title, level: level, category_id: category_id, author_id: author_id)
end

tests.each do |test|
  (1..TEST_QUESTIONS).each_with_index do |_, index|
    question = Question.create(body: "#{test.title} question #{index + 1}", test_id: test.id)
    Answer.create(body: "Answer for #{question.body}", correct: [false, true].sample, question_id: question.id)
  end
end
