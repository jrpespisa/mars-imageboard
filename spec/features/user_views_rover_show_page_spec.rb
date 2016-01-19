require "rails_helper"

feature "user views rover show page and sees images belonging to that rover" do

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
    visit "/"
    click_on "Rover_1"
  end

  scenario "user visits show page and sees links to images" do
    expect(page).to have_content "Terra Meridiani"
  end
  scenario "user clicks on image and is taken to the image show page" do
    expect(page).to have_content "North-facing view of Terra Meridiani"
  end
end
