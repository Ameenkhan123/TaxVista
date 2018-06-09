# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(first_name: 'Ameen', last_name: "Khan", email: "admin@gmail.com", password: "123456")
Accountant.create(first_name: 'Accountant', last_name: "sharma", email: "accountant@gmail.com", password: "123456", mobile: "9111990001")
Customer.create(first_name: 'Customer', last_name: "thakur", email: "customer@gmail.com", password: "123456", mobile: "90099900001")
