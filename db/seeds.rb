# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
ApplicationRecord.connection.reset_pk_sequence!('cats')
puts "Creating Cats"
Cat.create!(name: "Tattooed", birth_date: "2018/08/06", color: "orange", sex: "F")
Cat.create!(name: "Fixie", birth_date: "2020/02/06", color: "white", sex: "F")
Cat.create!(name: "Tacos", birth_date: "2017/04/24", color: "white", sex: "F")
Cat.create!(name: "Fingerstache", birth_date: "2011/10/09", color: "orange", sex: "M")
Cat.create!(name: "Cardigan", birth_date: "2017/08/02", color: "orange", sex: "F")
Cat.create!(name: "Flannel", birth_date: "2018/09/30", color: "white", sex: "M")
Cat.create!(name: "YR", birth_date: "2014/04/15", color: "orange", sex: "M")
Cat.create!(name: "Forage", birth_date: "2013/01/27", color: "white", sex: "F")
Cat.create!(name: "Thundercats", birth_date: "2020/11/20", color: "brown", sex: "M")
Cat.create!(name: "Hella", birth_date: "2017/08/17", color: "brown", sex: "F")

CatRentalRequest.destroy_all
ApplicationRecord.connection.reset_pk_sequence!('cat_rental_requests')
puts "Creating Cat Rental Requests"
CatRentalRequest.create!(cat_id: 1, start_date: "2021/5/11", end_date: "2021/5/18", status: "APPROVED")
CatRentalRequest.create!(cat_id: 2, start_date: "2021/5/11", end_date: "2021/5/18", status: "DENIED")
CatRentalRequest.create!(cat_id: 3, start_date: "2021/5/11", end_date: "2021/5/18")
CatRentalRequest.create!(cat_id: 4, start_date: "2021/5/11", end_date: "2021/5/18", status: "APPROVED")
CatRentalRequest.create!(cat_id: 5, start_date: "2021/5/11", end_date: "2021/5/18", status: "DENIED")
CatRentalRequest.create!(cat_id: 6, start_date: "2021/5/11", end_date: "2021/5/18")
CatRentalRequest.create!(cat_id: 7, start_date: "2021/5/11", end_date: "2021/5/18", status: "APPROVED")
CatRentalRequest.create!(cat_id: 8, start_date: "2021/5/11", end_date: "2021/5/18", status: "DENIED")
CatRentalRequest.create!(cat_id: 9, start_date: "2021/5/11", end_date: "2021/5/18")
CatRentalRequest.create!(cat_id: 10, start_date: "2021/5/11", end_date: "2021/5/18", status: "APPROVED")