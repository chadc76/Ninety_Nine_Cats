# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('session_tokens')
ApplicationRecord.connection.reset_pk_sequence!('user_sessions')
Cat.destroy_all
ApplicationRecord.connection.reset_pk_sequence!('cats')
CatRentalRequest.destroy_all
ApplicationRecord.connection.reset_pk_sequence!('cat_rental_requests')

last_year = Date.today.prev_year.year

10.times do
  puts "Creating User"
  u = User.create!(username: Faker::Name.name, password: "password")
  puts "Creating Cat"
  c = Cat.create!(
    user_id: u.id,
    name: Faker::Hipster.word,
    color: Cat::CAT_COLORS.sample,
    sex: ["M", "F"].sample,
    description: Faker::Hipster.sentence,
    birth_date: Faker::Date.between(from: 10.years.ago, to: Date.today)
    )
  puts "Creating Cat Rental Request"
    CatRentalRequest.create!(
    cat_id: Cat.last.id,
    user_id: User.last.id,
    start_date: Date.parse("#{last_year.to_s}-01-01"),
    end_date: Date.parse("#{last_year.to_s}-01-28"),
    status: 'APPROVED'
  )
end