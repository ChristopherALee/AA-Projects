# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all
t1 = Todo.create(title: "Mow lawn", body: "Mow the lawn", done: false)
t2 = Todo.create(title: "milk the cow", body: "grab the udder and go nuts", done: true)
t3 = Todo.create(title: "get groceries", body: "milk and cookies", done: true)
t4 = Todo.create(title: "finish W7D2 WRK", body: "do this", done: false)
t5 = Todo.create(title: "let air out of Dinkleberg's tires", body: "Dinkleberg!!!", done: true)
