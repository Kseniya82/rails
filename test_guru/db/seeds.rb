# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create(title: 'Easy')
Category.create(title: 'Middle')
Category.create(title: 'Hard')

Test.create(title: 'Физика', category_id: 1)
Test.create(title: 'История',category_id: 1)
Test.create(title: 'Философия',category_id: 2)
Test.create(title: 'Искусство', category_id: 3)

User.create('Иван Иванович', access: 'user')
User.create('Мария Петрова', access: 'user')
User.create('Колобок', access: 'user')

Question.create(body: 'Какая физическая величнина измеряется в амперах', test_id: 1)
Question.create(body: 'В каком году началась Вторая мировая война', test_id: 2)
Question.create(body: 'Коиу принадлежит фраза: я мыслю, значит я существую', test_id: 3)
Question.create(boby: 'Картины Айвазовского')

Answer.create(body:'Сила тока',question_id: 1)
Answer.create(body:'1939',question_id: 2)
Answer.create(body: 'Рене Декарт', question_id: 3)
Answer.create(body: '9 вал', question_id: 4)
Answer.create(body: 'Всемиррный потоп', question_id: 4)

TestsUsers.create(test_id: 1, user_id: 4)
TestsUsers.create(test_id: 1, user_id: 2)
TestsUsers.create(test_id: 2, user_id: 4)
TestsUsers.create(test_id: 2, user_id: 3)
TestsUsers.create(test_id: 2, user_id: 2)
TestsUsers.create(test_id: 3, user_id: 1)
