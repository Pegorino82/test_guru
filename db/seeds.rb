# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { name: 'User 1', email: 'user1@mail.com' },
                       { name: 'User 2', email: 'user2@mail.com' },
                       { name: 'User 3', email: 'user3@mail.com' }
                     ])

categories = Category.create!([
                                { title: 'Category 1' },
                                { title: 'Category 2' },
                                { title: 'Category 3' }
                              ])

tests = Test.create!([
                       { title: 'Test 1', level: 0, category: categories.first, author: users.first },
                       { title: 'Test 2', level: 1, category: categories[1], author: users[1] },
                       { title: 'Test 3', level: 2, category: categories.last, author: users.last },
                       { title: 'Test 4', level: 0, category: categories.first, author: users.first },
                       { title: 'Test 5', level: 1, category: categories[1], author: users[1] },
                       { title: 'Test 6', level: 2, category: categories.last, author: users.last },
                       { title: 'Test 7', level: 0, category: categories.first, author: users.first },
                       { title: 'Test 8', level: 1, category: categories[1], author: users[1] },
                       { title: 'Test 9', level: 2, category: categories.last, author: users.last }
                     ])

tests.each do |test|
  questions = Question.create!([
                                 { body: 'Question 1', test: test },
                                 { body: 'Question 2', test: test }
                               ])
  Answer.create!(body: 'Answer 1', correct: [false, true].sample, question: questions.first)
  Answer.create!(body: 'Answer 2', correct: [false, true].sample, question: questions.last)
end
