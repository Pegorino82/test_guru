# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { name: 'User 1' },
                       { name: 'User 2' },
                       { name: 'User 3' }
                     ])

categories = Category.create!([
                                { title: 'Category 1' },
                                { title: 'Category 2' },
                                { title: 'Category 3' }
                              ])

tests = Test.create!([
                       { title: 'Test 1', level: 0, category_id: categories.first.id, author_id: users.first.id },
                       { title: 'Test 2', level: 1, category_id: categories[1].id, author_id: users[1].id },
                       { title: 'Test 3', level: 2, category_id: categories.last.id, author_id: users.last.id },
                       { title: 'Test 4', level: 0, category_id: categories.first.id, author_id: users.first.id },
                       { title: 'Test 5', level: 1, category_id: categories[1].id, author_id: users[1].id },
                       { title: 'Test 6', level: 2, category_id: categories.last.id, author_id: users.last.id },
                       { title: 'Test 7', level: 0, category_id: categories.first.id, author_id: users.first.id },
                       { title: 'Test 8', level: 1, category_id: categories[1].id, author_id: users[1].id },
                       { title: 'Test 9', level: 2, category_id: categories.last.id, author_id: users.last.id }
                     ])

tests.each do |test|
  questions = Question.create!([
                                 { body: 'Question 1', test_id: test.id },
                                 { body: 'Question 2', test_id: test.id }
                               ])
  Answer.create!(body: 'Answer 1', correct: [false, true].sample, question_id: questions.first.id)
  Answer.create!(body: 'Answer 2', correct: [false, true].sample, question_id: questions.last.id)
end
