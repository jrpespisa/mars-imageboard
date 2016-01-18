describe Rover do

  it { should have_valid(:name).when("Pathfinder", "EURO MARS ROVER") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:description).when("This rover operated on Mars.") }
  it { should_not have_valid(:description).when(nil, "") }

end
