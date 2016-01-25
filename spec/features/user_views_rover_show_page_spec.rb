require "rails_helper"

feature "user views rover show page and sees images belonging to that rover" do

  before :each do
    test_seeder
    visit "/"
    click_on "Rover_1"
  end

  scenario "user visits show page and sees links to images" do
    expect(page).to have_css(".link")
  end
end
