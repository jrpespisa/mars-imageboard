require "rails_helper"

feature "user views index page" do

  before :each do
    test_seeder
  end

  scenario "user visits index page and sees title and rover descriptions" do
    visit "/"

    expect(page).to have_content "Red Planet"
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
