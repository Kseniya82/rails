# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or create!d alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create!([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create!(name: 'Luke', movie: movies.first)

category = []
category << Category.create!(title: 'Easy')
category << Category.create!(title: 'Middle')
category << Category.create!(title: 'Hard')

test = []
test << Test.create!(title: 'Физика', category_id: category[0].id)
test << Test.create!(title: 'История', category_id: category[0].id)
test << Test.create!(title: 'Философия', category_id: category[1].id)
test << Test.create!(title: 'Искусство', category_id: category[2].id)

user = []
user << User.create!(name:'Иван Иванович', access: 'user')
user << User.create!(name:'Мария Петрова', access: 'user')
user << User.create!(name:'Колобок', access: 'user')

question = []
question << Question.create!(body: 'Какая физическая величнина измеряется в амперах', test_id: test[0].id)
question << Question.create!(body: 'В каком году началась Вторая мировая война', test_id: test[1].id)
question << Question.create!(body: 'Коиу принадлежит фраза: я мыслю, значит я существую', test_id: test[2].id)
question << Question.create!(body: 'Картины Айвазовского', test_id: test[3].id)

answer = []
answer << Answer.create!(body:'Сила тока', question_id: question[0].id)
answer << Answer.create!(body:'1939', question_id: question[1].id)
answer << Answer.create!(body: 'Рене Декарт', question_id: question[2].id)
answer << Answer.create!(body: '9 вал', question_id: question[3].id)
answer << Answer.create!(body: 'Всемиррный потоп', question_id: question[3].id)

tester = []
tester << Tester.create!(test_id: test[0].id, user_id: user[2].id)
tester << Tester.create!(test_id: test[0].id, user_id: user[1].id)
tester << Tester.create!(test_id: test[1].id, user_id: user[1].id)
tester << Tester.create!(test_id: test[1].id, user_id: user[2].id)
tester << Tester.create!(test_id: test[3].id, user_id: user[2].id)
tester << Tester.create!(test_id: test[2].id, user_id: user[0].id)
