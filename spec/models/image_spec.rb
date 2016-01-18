describe Image do
  it { should belong_to :rover }

  it { should have_valid(:image).when(
      "Utopia_Planitia.jpg",
      "Cratered_Surface.png",
      "Acadalia_Planitia.jpeg",
      "Desert_Surface.gif"
    )
  }
  it { should_not have_valid(:image).when(nil, "") }

  it { should have_valid(:name).when("Cydonia", "Olympus Mons") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:description).when("Heavily Cratered", "Rocks and Dust") }
  it { should_not have_valid(:description).when(nil, "") }
end
