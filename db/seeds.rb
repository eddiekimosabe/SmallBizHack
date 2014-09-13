# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
10.times do
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
    received_date: Date.now,
    receiver_id: Business.all.sample
  )
  user.business.receivable_invoices.create(
    amount: rand(100..1000),
    due_date: rand(60).days.from_now,
    received_date: Date.now,
    payable_id: Business.all.sample
  )
end
