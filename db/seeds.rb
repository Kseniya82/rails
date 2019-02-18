# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

categories= Category.create!([
  { title: 'Easy' },
  { title: 'Middle' },
  { title: 'Hard'}
])

tests = Test.create!([
  { title: 'Физика', category_id: categories[0].id},
  { title: 'История', category_id: categories[0].id},
  { title: 'Философия', category_id: categories[1].id },
  { title: 'Искусство', category_id: categories[2].id}
])

questions = Question.create!([
  { body: 'Какая физическая величина измеряется в амперах', test_id: tests[0].id },
  { body: 'В каком году началась Вторая мировая война', test_id: tests[1].id },
  { body: 'Коиу принадлежит фраза: я мыслю, значит я существую', test_id: tests[2].id },
  { body: 'Картины Айвазовского', test_id: tests[3].id }
])

answers = Answer.create!([
  { body:'Сила тока', question_id: questions[0].id },
  { body:'1939', question_id: questions[1].id },
  { body: 'Рене Декарт', question_id: questions[2].id },
  { body: '9 вал', question_id: questions[3].id },
  { body: 'Всемиррный потоп', question_id: questions[3].id }
])
