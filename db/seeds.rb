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
  description: "Spirit description"
)

Rover.create(
  image_url: "Opportunity_rover.jpg",
  name: "Opportunity",
  description: "Opportunity description"
)

Rover.create(
  image_url: "Curiosity_rover.png",
  name: "Curiosity",
  description: "Curiosity description"
)

counter = 1
key = ENV["API_KEY"]
20.times do
  uri = URI("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=#{counter}&api_key=#{key}")
  response = Net::HTTP.get_response(uri)
  curiosity_info = JSON.parse(response.body)
  curiosity_photo = curiosity_info["photos"][0]["img_src"]
  curiosity_name = curiosity_info["photos"][0]["rover"]["name"]
  curiosity_description = curiosity_info["photos"][0]["camera"]["full_name"]
  Image.create(image: "#{curiosity_photo}", name: "#{curiosity_name}", description: "#{curiosity_description}", rover_id: 3 )
  counter += 1
end
