require 'rails_helper'

feature "user can add comment to a specific image" do
  let(:rover1) { FactoryGirl.create(:rover, name: "Rover_1") }
  let(:rover2) { FactoryGirl.create(:rover, name: "Rover_2") }
  let(:rover3) { FactoryGirl.create(:rover, name: "Rover_3") }

  let(:image1) { FactoryGirl.create(:image, name: "Image_1", rover_id: rover1.id) }
  let(:image2) { FactoryGirl.create(:image, name: "Image_2", rover_id: rover2.id) }
  let(:image3) { FactoryGirl.create(:image, name: "Image_3", rover_id: rover3.id) }

  let(:user) { FactoryGirl.create(:user)}

  before :each do
    rover1
    rover2
    rover3
    image1
    image2
    image3
  end

  scenario "user successfully adds comment" do
    comment

    expect(page).to have_content "Here is a test comment"
    expect(page).to have_content "Add Comment"
  end

  scenario "user cannot add comment if they are not logged in" do
    visit root_path
    click_on "Rover_1"
    page.first(".link").click

    expect(page).to have_content "Comments:"
    expect(page).to_not have_content "Add Comment"

  end
  scenario "user cannot visit the url path for new comment without signing in" do
    visit new_image_comment_path(image1)

    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).to have_content "Log In"
  end

  scenario "user can edit their own comment" do
    comment
    click_on "Edit Comment"
    fill_in "Comment", with: "This is a different comment"
    click_button "Update"

    expect(page).to have_content "This is a different comment"
    expect(page).to have_content "Add Comment"
  end

  scenario "user can delete their own comment" do
    comment
    click_on "Delete Comment"

    expect(page).to_not have_content "Here is a test comment"
    expect(page).to have_content "Add Comment"
  end
end

def comment
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
  click_on "Rover_1"
  page.first(".link").click
  click_link "Add Comment"
  fill_in "Comment", with: "Here is a test comment"
  click_button "Create Comment"
end
