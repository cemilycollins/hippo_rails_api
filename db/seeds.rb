# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all
# Review.destroy_all

User.create([
  {name: "Emily Collins", email: "emily.collins@hotmail.com", city: "Arlington", state: "VA", password: "pw", profile_pic: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/16938575_10155192865689653_1626084982365907535_n.jpg?_nc_cat=0&oh=69ed9578959bd589b8fdfa8a75a1a5f9&oe=5C61609F", type_of: "user"}
  ])

Review.create([
  {hospital_id: Hospital.find_by(city: "DOTHAN").id, user_id: User.find_by(name: "Emily Collins").id, body: "this hospital was alright", rating: 3, date: Date.new(2018, 2, 3)}
  ])

Procedure.create([
  {name: "HEART TRANSPLANT OR IMPLANT OF HEART ASSIST SYSTEM W MCC", procedure_number_string: "001" },
  {name: "ECMO OR TRACH W MV >96 HRS OR PDX EXC FACE, MOUTH & NECK W MAJ O.R.", procedure_number_string: "003" }
  ])

HospitalProcedure.create([
  {hospital_id: 1, procedure_id: 2, average_covered_charges: 351199.22, average_medicare_payments: 124736.39, average_total_payments: 133851.52, total_discharges: 23 },
  {hospital_id: 2, procedure_id: 2, average_covered_charges: 244188.69, average_medicare_payments: 81924.69, average_total_payments: 111503.76, total_discharges: 29 },
  {hospital_id: 3, procedure_id: 2, average_covered_charges: 421338.82, average_medicare_payments: 116974.55, average_total_payments: 124029.36, total_discharges: 11 },
  {hospital_id: 4, procedure_id: 2, average_covered_charges: 553218.76, average_medicare_payments: 137077.94, average_total_payments: 204460.45, total_discharges: 33 },
  {hospital_id: 1, procedure_id: 1, average_covered_charges: 1008707.27, average_medicare_payments: 203063.27, average_total_payments: 279715.36, total_discharges: 11 },
  {hospital_id: 2, procedure_id: 1, average_covered_charges: 757234.00, average_medicare_payments: 199724.69, average_total_payments: 212550.50, total_discharges: 16 },
  {hospital_id: 3, procedure_id: 1, average_covered_charges: 736870.47, average_medicare_payments: 160168.44, average_total_payments: 168822.91, total_discharges: 34 },
  {hospital_id: 4, procedure_id: 1, average_covered_charges: 523248.78, average_medicare_payments: 246511.72, average_total_payments: 258611.39, total_discharges: 18 }
])
