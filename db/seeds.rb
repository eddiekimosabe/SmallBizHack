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

10.times do
  User.create(
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

20.times do
  business = Business.create(name: Faker::Company.name)
end

User.all.each do |user|

  Business.create(name: Faker::Company.name, user_id: user.id)
  received_date = rand(-30..0)
  user.business.payable_invoices.create(
    amount: rand(100..1000),
    due_date: rand(received_date..30).days.from_now,
    received_date: received_date.days.from_now,
    receiver_id: Business.all.sample.id

  )
  received_date = rand(-30..0)
  user.business.receivable_invoices.create(
    amount: rand(100..1000),
    due_date: rand(received_date..30).days.from_now,
    received_date: received_date.days.from_now,
    payer_id: Business.all.sample.id
  )
end

10.times do
  received_date = rand(-30..0)
  User.first.business.payable_invoices.create(
    amount: rand(100..1000),
    due_date: rand(received_date..30).days.from_now,
    received_date: received_date.days.from_now,
    receiver_id: Business.all.sample.id
  )
  received_date = rand(-30..0)
  User.first.business.receivable_invoices.create(
    amount: rand(100..1000),
    due_date: rand(received_date..30).days.from_now,
    received_date: received_date.days.from_now,
    payer_id: Business.all.sample.id
  )
end

20.times do
  Business.all.sample.raised_flags.create(flagged_id: Business.all.sample.id, flagged_invoice_id: Invoice.all.sample.id)
end
