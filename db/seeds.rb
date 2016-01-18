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

rover_info = {
  "Spirit" => "Spirit description",
  "Opportunity" => "Opportunity description",
  "Curiosity" => "Curiosity description"
}

rover_info.each do |key, value|
  Rover.create(name: "#{key}", description: "#{value}")
end
