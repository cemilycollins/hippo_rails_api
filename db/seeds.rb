# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
# Review.destroy_all

User.create([
  {name: "Emily Collins", email: "emily@me.com", city: "Arlington", state: "VA", password: "pw", profile_pic: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/16938575_10155192865689653_1626084982365907535_n.jpg?_nc_cat=0&oh=69ed9578959bd589b8fdfa8a75a1a5f9&oe=5C61609F", type_of: "user"},
  {name: "Ruby", email: "ruby@me.com", city: "Washington", state: "DC", password: "pw", profile_pic: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/12274462_1234022579947479_6790581198035634889_n.jpg?_nc_cat=105&oh=34e7dc35524c2bd354f6f1441a08e2c8&oe=5C56987A", type_of: "user"},
  {name: "Alvaro", email: "alvaro@me.com", city: "Alexandria", state: "VA", password: "pw", profile_pic: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/39004199_10156397322500619_2042360174491992064_n.jpg?_nc_cat=108&oh=7333e151838e6c4b0abca061602ed6f7&oe=5C5A3DAD", type_of: "user"},
  {name: "Andres", email: "andres@me.com", city: "Washington", state: "DC", password: "pw", profile_pic: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/32960584_458305417959339_2502761465824411648_n.jpg?_nc_cat=111&oh=062577191c3f6c3a9db251abc6e37ac2&oe=5C18B6C2", type_of: "user"},
  {name: "Ayana", email: "ayana@me.com", city: "Washington", state: "DC", password: "pw", profile_pic: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/34091877_2285618728131617_2791456870970163200_n.jpg?_nc_cat=111&oh=8a7b401b5c9644bb73130e6dca8b067b&oe=5C56C878", type_of: "user"},
  {name: "Ryan", email: "ryan@me.com", city: "Bethesda", state: "MD", password: "pw", profile_pic: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/36177165_10156340047595833_1679274969411878912_n.jpg?_nc_cat=104&oh=470255fec9fecfe84ad4ab983c8c42dd&oe=5C1AF533", type_of: "user"},
  {name: "Josh", email: "josh@me.com", city: "Arlington", state: "VA", password: "pw", profile_pic: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/11214225_10102628127652989_4427566781655564597_n.jpg?_nc_cat=105&oh=640a34590d7ef33436a0ea916d55b1b3&oe=5C61F6B9", type_of: "user"}
  ])

def random(num)
  rand(num) + 1
end

dates = [
  Date.new(2018, random(9), random(28)),
  Date.new(2017, random(12), random(28)),
  Date.new(2016, random(12), random(28))
]

body = [
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Venenatis a condimentum vitae sapien pellentesque habitant morbi tristique. Sed vulputate mi sit amet. Sit amet commodo nulla facilisi nullam vehicula. Faucibus scelerisque eleifend donec pretium.",
  "Mi tempus imperdiet nulla malesuada pellentesque elit eget gravida cum. Dolor sit amet consectetur adipiscing elit pellentesque habitant morbi. Phasellus vestibulum lorem sed risus ultricies. Vel pretium lectus quam id leo in vitae. Nunc mi ipsum faucibus vitae aliquet nec ullamcorper sit amet. Fames ac turpis egestas maecenas pharetra convallis posuere.",
  "Cras ornare arcu dui vivamus arcu felis bibendum ut tristique. At urna condimentum mattis pellentesque id nibh. In hac habitasse platea dictumst. Justo nec ultrices dui sapien eget. Tempus urna et pharetra pharetra. Malesuada fames ac turpis egestas integer eget aliquet.",
  "Fames ac turpis egestas integer. Gravida quis blandit turpis cursus in hac habitasse platea dictumst. Eget nullam non nisi est. Ut tellus elementum sagittis vitae et leo duis ut diam. Venenatis cras sed felis eget velit aliquet sagittis id. Arcu cursus euismod quis viverra nibh cras."
]

Hospital.all.forEach do |h|
  3 times do
    user = User.find(random(7))
    Review.create(hospital_id: h.id, user_id: user.id, body: body[rand(5)], rating: random(5), date: dates[rand(3)], user_name: user.name, hospital_name: h.name)
  end
end
