# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(username: "admin_user",
  email: "admin_user@gmail.com",
  password: "admins_pass",
  password_confirmation: "admins_pass",
  admin: true
)

Category.create!(category: "SUV")
Category.create!(category: "Sedan")
# manufacturer1 = Manufacturer.new(
#   manufacturer: "Audi",
#   about: "Audi AG is a German automobile manufacturer that designs, engineers, produces, markets and distributes luxury vehicles. Audi is a member of the Volkswagen Group and has its roots at Ingolstadt, Bavaria, Germany. Audi-branded vehicles are produced in nine production facilities worldwide."
# )

# manufacturer1.image.attach(
#   io: File.open('public/audi.jpg'),
#   filename: 'audi.jpg'
# )
# manufacturer1.logo.attach(
#   io: File.open('public/audi_logo.png'),
#   filename: 'audi_logo.png'
# )
# manufacturer1.save!

# manufacturer2 = Manufacturer.new(
#   manufacturer: "Volkswagen",
#   about: "Volkswagen, shortened to VW, is a German automaker
#     founded in 1937 by the German Labour Front, known for the iconic Beetle and headquartered in Wolfsburg.
#     It is the flagship brand of the Volkswagen Group, the largest automaker by worldwide sales in 2016 and 2017."
# )
# manufacturer2.image.attach(
#   io: File.open('public/vw_c.jpg'),
#   filename: 'vw_c.jpg'
# )
# manufacturer2.logo.attach(
#   io: File.open('public/vw_logo.svg.png'),
#   filename: 'vw_logo.svg.png'
# )
# manufacturer2.save!

# car1 = Car.new(
#   manufacturer_id: 1,
#   category_id: 1,
#   model: "Q8" ,
#   price: 1500,
#   status: "Available",
#   color: "Black",
#   year: "2020",
#   description: "The Audi Q8 is a mid-size luxury crossover SUV coupé made by Audi that was launched in 2018.
#     It is the flagship of the Audi SUV line, and is being produced at the Volkswagen Bratislava Plant."
# )
# car1.image.attach(
#   io: File.open('public/Q8.jpg'),
#   filename: 'Q8.jpg'
# )
# car1.save!

# car2 = Car.new(
#   manufacturer_id: 2,
#   category_id: 1,
#   model: "Tiguan", 
#   price: 1000,
#   status: "Available",
#   color: "White",
#   year: "2019",
#   description: "The Volkswagen Tiguan is a crossover SUV manufactured by German automaker Volkswagen.
#   Introduced in 2007 as the second crossover SUV model under..."
# )

# car2.image.attach(
#   io: File.open('public/VW_tiguan.jpg'),
#   filename: 'VW_tiguan.jpg'
# )
# car2.save!