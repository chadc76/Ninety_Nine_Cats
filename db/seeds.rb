# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Cat.destroy_all
Cat.connection.execute("ALTER SEQUENCE cats_id_seq RESTART WITH 1")
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