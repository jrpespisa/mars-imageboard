require_relative "../lib/seeder.rb"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Rover.create(
  image_url: "Spirit_rover.jpg",
  name: "Spirit",
  description: "Spirit (also known as MER-A) is a robotic rover on Mars that
  was active from 2004-2010. It was launched from Earth on June 10th, 2003 as
  part of the Mars Exploration Rover mission. It's twin, Opportunity, arrived on
  Mars three weeks after Spirit touched down on the red planet."
)

Rover.create(
  image_url: "Opportunity_rover.jpg",
  name: "Opportunity",
  description: "Opportunity (also known AS MER-B) is a robot rover on Mars that
  landed on the planet in 2004 and is still active to this day. It, like Spirit,
  was launched as part of the Mars Exploration Rover mission in 2003. It has and
  still is performing a variety of scientific research missions on the red planet."
)

Rover.create(
  image_url: "Curiosity_rover.png",
  name: "Curiosity",
  description: "Curiosity is a large rover that landed in the Gale Crater
  on Mars on August 6, 2012 as part of NASA's Mars Science Laboratory (MSL)
  mission. It is about the size of a car and contains the most advanced
  analytical equipment of any rover sent to the red planet."
)

# counter = 1
# key = ENV["API_KEY"]
# 20.times do
#   uri = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=#{counter}&api_key=#{key}")
#   response = Net::HTTP.get_response(uri)
#   curiosity_info = JSON.parse(response.body)
#   curiosity_photo = curiosity_info["photos"][0]["img_src"]
#   curiosity_name = curiosity_info["photos"][0]["rover"]["name"]
#   curiosity_description = curiosity_info["photos"][0]["camera"]["full_name"]
#   Image.create(image: "#{curiosity_photo}", name: "#{curiosity_name}", description: "#{curiosity_description}", rover_id: 3 )
#   counter += 1
# end

image_counter = 0
page_counter = 1
8.times do
  seeder = Seeder.new("Curiosity", image_counter, page_counter)
  seeder.add_image
  seeder = Seeder.new("Spirit", image_counter, page_counter)
  seeder.add_image
  seeder = Seeder.new("Opportunity", image_counter, page_counter)
  seeder.add_image
  page_counter += 1
  if page_counter >= 3
    page_counter = 1
    image_counter += 3
  end
end

# # counter = 1
# 10.times do
#   seeder = Seeder.new("Spirit", counter)
#   seeder.add_image
#   # counter += 1
# end
#
# # counter = 1
# 6.times do
#   seeder = Seeder.new("Opportunity", counter)
#   seeder.add_image
#   # counter += 1
# end
