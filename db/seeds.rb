# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ERROR = "error".freeze
WARNING = "warning".freeze
ACTIVE = "active".freeze
MAINTENANCE = "maintenance".freeze

city = City.create(name: "Santiago")
city2 = City.create(name: "Viña del Mar")

commune = Commune.create(name: "Providencia", city: city)
commune2 = Commune.create(name: "Las Condes", city: city)
commune3 = Commune.create(name: "Ñuñoa", city: city)
commune4 = Commune.create(name: "Viña del Mar", city: city2)

restaurant = Restaurant.create(name: "Sushi Niu Providencia", address: "Hernando de Aguirre 140", commune: commune)
restaurant2 = Restaurant.create(name: "Sushi Niu Las Condes", address: "Apoquindo 4830 Local 18A", commune: commune2)
restaurant3 = Restaurant.create(name: "Sushi Niu Ñuñoa", address: "Campo de Deportes 156 local 3", commune: commune3)
restaurant4 = Restaurant.create(name: "Sushi Niu Valparaíso", address: "Valparaíso 140", commune: commune4)
restaurant5 = Restaurant.create(name: "Sushi Niu Viña del Mar", address: "Av. Libertad 1154 local F", commune: commune4)

pos = Category.create(name: "POS")
printer = Category.create(name: "Impresora")
cash_register = Category.create(name: "Caja")
router = Category.create(name: "Router")

#restaurant 1

Device.create name: "Transbank", category: pos, restaurant: restaurant, status: ACTIVE, version: "1.0.0"
Device.create name: "RedNet", category: pos, restaurant: restaurant, status: ACTIVE, version: "1.0.0"
Device.create name: "Banco Estado", category: pos, restaurant: restaurant, status: MAINTENANCE, version: "1.0.0"

Device.create name: "Ricoh 1", category: printer, restaurant: restaurant, status: ACTIVE, version: "1.0.0"
Device.create name: "Ricoh 2", category: printer, restaurant: restaurant, status: ACTIVE, version: "1.0.0"

Device.create name: "Caja 1", category: cash_register, restaurant: restaurant, status: ACTIVE, version: "1.0.0"
Device.create name: "Caja 2", category: cash_register, restaurant: restaurant, status: ACTIVE, version: "1.0.0"

Device.create name: "Router Linksys", category: router, restaurant: restaurant, status: ACTIVE, version: "1.0.0"
Device.create name: "Router Cisco", category: router, restaurant: restaurant, status: ERROR, version: "1.0.0"


# ------------------------------------------------

#restaurant 2
Device.create name: "Transbank", category: pos, restaurant: restaurant2, status: ACTIVE, version: "1.0.0"
Device.create name: "RedNet", category: pos, restaurant: restaurant2, status: ACTIVE, version: "1.0.0"
Device.create name: "Banco Estado", category: pos, restaurant: restaurant2, status: ACTIVE, version: "1.0.0"

Device.create name: "Ricoh 1", category: printer, restaurant: restaurant2, status: ACTIVE, version: "1.0.0"
Device.create name: "Ricoh 2", category: printer, restaurant: restaurant2, status: ACTIVE, version: "1.0.0"

Device.create name: "Caja 1", category: cash_register, restaurant: restaurant2, status: ACTIVE, version: "1.0.0"
Device.create name: "Caja 2", category: cash_register, restaurant: restaurant2, status: ACTIVE, version: "1.0.0"

Device.create name: "Router Linksys", category: router, restaurant: restaurant2, status: ACTIVE, version: "1.0.0"
Device.create name: "Router Cisco", category: router, restaurant: restaurant2, status: ACTIVE, version: "1.0.0"
# ------------------------------------------------

#restaurant 3
Device.create name: "Transbank", category: pos, restaurant: restaurant3, status: ACTIVE, version: "1.0.0"
Device.create name: "RedNet", category: pos, restaurant: restaurant3, status: ACTIVE, version: "1.0.0"
Device.create name: "Banco Estado", category: pos, restaurant: restaurant3, status: ACTIVE, version: "1.0.0"

Device.create name: "Ricoh 1", category: printer, restaurant: restaurant3, status: ACTIVE, version: "1.0.0"
Device.create name: "Ricoh 2", category: printer, restaurant: restaurant3, status: ERROR, version: "1.0.0"

Device.create name: "Caja 1", category: cash_register, restaurant: restaurant3, status: ACTIVE, version: "1.0.0"
