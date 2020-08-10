# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(name: 'Fighting', priority: 1)
Category.create(name: 'Patform', priority: 2)
Category.create(name: "Beat'em up", priority: 1)
Category.create(name: 'Shooter', priority: 1)
Category.create(name: 'Action RPG', priority: 3)
Category.create(name: 'Stealth', priority: 3)
Category.create(name: 'Survival', priority: 4)
Category.create(name: 'Survival Horror', priority: 5)
Category.create(name: 'Tactical RPG', priority: 3)
Category.create(name: 'Casual', priority: 5)
Category.create(name: 'MMORPG', priority: 4)
Category.create(name: 'MMO', priority: 3)
