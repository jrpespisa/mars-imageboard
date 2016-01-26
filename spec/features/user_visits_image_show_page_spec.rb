require "rails_helper"

feature "user views index page" do

  before :each do
    test_seeder
    visit "/"
    click_on "Rover_1"
  end
  scenario "user clicks on image and is taken to new show page" do
    page.first(".img-link").click

    expect(page).to have_content "North-facing view of Terra Meridiani"
  end
end
