# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
                       { name: 'User 1', email: 'user1@mail.com', password: 'qwerty' },
                       { name: 'User 2', email: 'user2@mail.com', password: 'qwerty' },
                       { name: 'User 3', email: 'user3@mail.com', password: 'qwerty' }
                     ])

categories = Category.create!([
                                { title: 'Category 1' },
                                { title: 'Category 2' },
                                { title: 'Category 3' }
                              ])

tests = Test.create!([
                       { title: 'Test 1', level: 0, category: categories.first, author: users.first },
                       { title: 'Test 2', level: 3, category: categories[1], author: users[1] },
                       { title: 'Test 3', level: 5, category: categories.last, author: users.last },
                       { title: 'Test 4', level: 0, category: categories.first, author: users.first },
                       { title: 'Test 5', level: 3, category: categories[1], author: users[1] },
                       { title: 'Test 6', level: 5, category: categories.last, author: users.last },
                       { title: 'Test 7', level: 0, category: categories.first, author: users.first },
                       { title: 'Test 8', level: 3, category: categories[1], author: users[1] },
                       { title: 'Test 9', level: 5, category: categories.last, author: users.last }
                     ])

tests.each do |test|
  questions = Question.create!([
                                 { body: 'Question 1', test: test },
                                 { body: 'Question 2', test: test }
                               ])
  Answer.create!(body: 'Answer 1 (correct)', correct: true, question: questions.first)
  Answer.create!(body: 'Answer 2', correct: false, question: questions.last)
end

badges = Badge.create!([
                         { title: 'All Category 1',
                           path: 'https://cdn-icons-png.flaticon.com/512/1378/1378577.png',
                           rule: 0,
                           rule_value: 1 },
                         { title: 'All easy',
                           path: 'https://cdn-icons-png.flaticon.com/512/744/744935.png',
                           rule: 1,
                           rule_value: 'easy' },
                         { title: 'On first try',
                           path: 'https://cdn-icons-png.flaticon.com/512/744/744984.png',
                           rule: 2,
                           rule_value: '' },
                       ])
