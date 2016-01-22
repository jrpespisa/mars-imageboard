require 'rails_helper'

feature "user can create an account" do
  scenario "user specifies valid information " do
    visit root_path
    click_on "Sign Up"
    fill_in "First Name", with: "John"
    fill_in "Last Name", with: "Doe"
    fill_in "Email", with: "johndoe@email.com"
    fill_in "user_password", with: "password"
    fill_in "Confirm Password", with: "password"
    click_button "Sign Up"

    expect(page).to have_content "Welcome to Red Planet!"
    expect(page).to have_content "Sign Out"
    expect(page).to have_content "Edit Account"
  end

  scenario "user specifies invalid information" do
    visit root_path
    click_link "Sign Up"
    click_button "Sign Up"

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Sign Out"
  end

  scenario "password confirmation" do
    visit root_path
    click_link "Sign Up"
    fill_in "user_password", with: "password"
    fill_in "Confirm Password", with: "passwod"
    click_button "Sign Up"

    expect(page).to have_content "doesn't match"
    expect(page).to_not have_content "Sign Out"
  end
end
