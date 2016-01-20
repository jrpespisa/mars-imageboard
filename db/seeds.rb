require_relative "../lib/seeder.rb"

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
