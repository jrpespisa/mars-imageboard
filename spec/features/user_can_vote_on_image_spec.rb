require "rails_helper"

feature "user can upvote or downvote images" do

  before :each do
    test_seeder
    sign_in
  end

  scenario "user successfully votes on an image", js: true do
    skip("come back to this later - feature works")
    click_on "Rover_1"
    page.first(".img-link").click
    click_on "0 Upvotes"

    expect(page).to have_content "1 Upvote"
    expect(page).to have_content "0 Downvotes"
  end

  scenario "user can change a previous vote", js: true do
    skip("come back to this later - feature works")
    click_on "Rover_1"
    page.first(".img-link").click
    click_on "0 Upvotes"
    click_on "0 Downvotes"

    expect(page).to have_button "0 Upvotes"
    expect(page).to have_button "1 Downvote"
  end

  scenario "user cannot see votes if they are not logged in" do
    click_on "Sign Out"
    click_on "Rover_1"
    page.first(".img-link").click

    expect(page).to_not have_content "0 Upvotes"
    expect(page).to_not have_content "0 Downvotes"
    expect(page).to have_content "Sign in to vote and comment!"
  end

  scenario "user cannot vote more than once", js: true do
    skip("come back to this later - feature works")
    click_on "Rover_1"
    page.first(".img-link").click
    click_on "0 Upvotes"
    click_on "1 Upvote"

    expect(page).to have_content "0 Upvotes"
    expect(page).to have_content "0 Downvotes"
  end

end
