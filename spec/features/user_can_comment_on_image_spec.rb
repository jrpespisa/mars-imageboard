require 'rails_helper'

feature "user can add comment to a specific image" do

  before :each do
    comment
  end

  scenario "user successfully adds comment" do

    expect(page).to have_content "Here is a test comment"
    expect(page).to have_content "Add Comment"
  end

  scenario "user cannot add comment if they are not logged in" do
    click_on "Sign Out"
    visit root_path
    click_on "Rover_1"
    page.first(".link").click

    expect(page).to have_content "North-facing view of Terra Meridiani"
    expect(page).to_not have_content "Add Comment"

  end
  scenario "user cannot visit the url path for new comment without signing in" do
    click_on "Sign Out"
    visit new_image_comment_path(@image1)

    expect(page).to have_content("You need to sign in or sign up before continuing.")
    expect(page).to have_content "Log In"
  end

  scenario "user can edit their own comment" do
    click_on "Edit Comment"
    fill_in "Comment", with: "This is a different comment"
    click_button "Update"

    expect(page).to have_content "This is a different comment"
    expect(page).to have_content "Add Comment"
  end

  scenario "user can delete their own comment" do
    click_on "Delete Comment"

    expect(page).to_not have_content "Here is a test comment"
    expect(page).to have_content "Add Comment"
  end
end

def comment
  test_seeder
  visit new_user_session_path
  fill_in "Email", with: @user.email
  fill_in "Password", with: @user.password
  click_button "Sign In"
  click_on "Rover_1"
  page.first(".link").click
  click_link "Add Comment"
  fill_in "Comment", with: "Here is a test comment"
  click_button "Create Comment"
end
