# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rovers = [
#   Rover.create(name: "Spirit", description: "Spirit description"),
#   Rover.create(name: "Opportunity", description: "Opportunity description"),
#   Rover.create(name: "Curiosity", description: "Curiosity description")
# ]


Rover.create(image_url: "Spirit_rover.jpg", name: "Spirit", description: "Spirit description")
Rover.create(image_url: "Opportunity_rover.jpg", name: "Opportunity", description: "Opportunity description")
Rover.create(image_url: "Curiosity_rover.png", name: "Curiosity", description: "Curiosity description")
