require "rails_helper"

feature "user views index page" do

  let(:rover1) { FactoryGirl.create(:rover, name: "Rover_1") }
  let(:rover2) { FactoryGirl.create(:rover, name: "Rover_2") }
  let(:rover3) { FactoryGirl.create(:rover, name: "Rover_3") }

  let(:image1) { FactoryGirl.create(:image, name: "Image_1", rover_id: rover1.id) }
  let(:image2) { FactoryGirl.create(:image, name: "Image_2", rover_id: rover2.id) }
  let(:image3) { FactoryGirl.create(:image, name: "Image_3", rover_id: rover3.id) }

  before :each do
    rover1
    rover2
    rover3
    image1
    image2
    image3
  end

  scenario "user visits index page and sees title and rover descriptions" do
    visit "/"

    expect(page).to have_content "Mars Imageboard"
    expect(page).to have_content "Rover_1"
    expect(page).to have_content "Rover_2"
    expect(page).to have_content "Rover_3"
  end
  scenario "user clicks on a rover's name and is taken to it's show page" do
    visit "/"
    click_on "Rover_1"

    expect(page).to have_content "This rover was launched in July of 2003 and
    has been operational on the red planet ever since."
  end
end
