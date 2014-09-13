# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
  email: "test@test.com",
  password: "testing123"
)


9.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

20.times do
  Business.create(name: Faker::Company.name)
end

User.all.each do |user|
  Business.create(name: Faker::Company.name, user_id: user.id)
  user.business.payable_invoices.create(
    amount: rand(100..1000),
    due_date: rand(60).days.from_now,
    received_date: DateTime.now,
    receiver_id: Business.all.sample.id
  )
  user.business.receivable_invoices.create(
    amount: rand(100..1000),
    due_date: rand(60).days.from_now,
    received_date: DateTime.now,
    payer_id: Business.all.sample.id
  )
end

10.times do
  User.first.business.payable_invoices.create(
    amount: rand(100..1000),
    due_date: rand(60).days.from_now,
    received_date: DateTime.now,
    receiver_id: Business.all.sample.id
  )
  User.first.business.receivable_invoices.create(
    amount: rand(100..1000),
    due_date: rand(60).days.from_now,
    received_date: DateTime.now,
    payer_id: Business.all.sample.id
  )
end