# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all

u1 = User.create(username: "user1")
u2 = User.create(username: "user2")
u3 = User.create(username: "user3")

Poll.destroy_all

p1 = Poll.create(title: "Food", user_id: u1.id)
p2 = Poll.create(title: "Locations", user_id: u2.id)
p3 = Poll.create(title: "Feelings", user_id: u3.id)

Question.destroy_all

q1 = Question.create(text: "What are we eating?", poll_id: p1.id)
q2 = Question.create(text: "What are we drinking?", poll_id: p1.id)

q3 = Question.create(text: "Where are you going?", poll_id: p2.id)
q4 = Question.create(text: "Where am I going?", poll_id: p2.id)

q5 = Question.create(text: "How are you feeling?", poll_id: p3.id)
q6 = Question.create(text: "How am I feeling?", poll_id: p3.id)


AnswerChoice.destroy_all

ac1 = AnswerChoice.create(text: "Chicken", question_id: q1.id)
ac2 = AnswerChoice.create(text: "Steak", question_id: q1.id)

ac3 = AnswerChoice.create(text: "Coke", question_id: q2.id)
ac4 = AnswerChoice.create(text: "Pepsi", question_id: q2.id)

ac5 = AnswerChoice.create(text: "AppAcademy", question_id: q3.id)
ac6 = AnswerChoice.create(text: "Home", question_id: q3.id)

ac7 = AnswerChoice.create(text: "Supermarket", question_id: q4.id)
ac8 = AnswerChoice.create(text: "Gym", question_id: q4.id)

ac9 = AnswerChoice.create(text: "Super", question_id: q5.id)
ac10 = AnswerChoice.create(text: "Bad", question_id: q5.id)

ac11 = AnswerChoice.create(text: "Good", question_id: q6.id)
ac12 = AnswerChoice.create(text: "Ok", question_id: q6.id)


Response.destroy_all

r1 = Response.create(user_id: u1.id, answer_choice_id: ac1.id)
r2 = Response.create(user_id: u2.id, answer_choice_id: ac11.id)
r3 = Response.create(user_id: u3.id, answer_choice_id: ac6.id)
r4 = Response.create(user_id: u2.id, answer_choice_id: ac8.id)
r5 = Response.create(user_id: u1.id, answer_choice_id: ac11.id)