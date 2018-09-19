# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Hospital.destroy_all
Review.destroy_all

User.create([
  {name: "Emily Collins", email: "emily.collins@hotmail.com", city: "Arlington", state: "VA", password: "pw", profile_pic: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/16938575_10155192865689653_1626084982365907535_n.jpg?_nc_cat=0&oh=69ed9578959bd589b8fdfa8a75a1a5f9&oe=5C61609F", type_of: "user"}
  ])

Hospital.create([
  {name: "SOUTHEAST ALABAMA MEDICAL CENTER", street_address: "1108 ROSS CLARK CIRCLE", latitude: 31.214058, longitude: -85.361725, city: "Dothan", state: "AL", zip_code: 36301, rating_average: 4}
  ])

Review.create([
  {hospital_id: Hospital.find_by(city: "Dothan").id, user_id: User.find_by(name: "Emily Collins").id, body: "this hospital was alright", rating: 3, date: Date.new(2018, 2, 3)}
  ])
