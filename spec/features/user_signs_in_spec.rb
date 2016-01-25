require 'spec_helper'

feature "user signs in" do

  let!(:user) { FactoryGirl.create(:user) }

  scenario "user sign in successful" do
    user_sign_in

    expect(page).to have_content "Welcome back!"
    expect(page).to have_content "Sign Out"
  end

  scenario "non-existant user attempts sign in" do
    visit new_user_session_path
    fill_in "Email", with: "Nobody@nobody.com"
    fill_in "Password", with: "Nothing"
    click_button "Sign In"

    expect(page).to have_content "Invalid email or password"
    expect(page).to_not have_content "Welcome back!"
    expect(page).to_not have_content "Sign Out"
  end

  scenario "incorrect password denied access" do
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "Nothing"
    click_button "Sign In"

    expect(page).to have_content "Invalid email or password"
    expect(page).to_not have_content "Welcome back!"
    expect(page).to_not have_content "Sign Out"
  end

  scenario "already signed-in user attempts to sign in again" do
    user_sign_in

    expect(page).to have_content "Sign Out"
    expect(page).to_not have_content "Sign In"

    visit new_user_session_path

    expect(page).to have_content "You are already signed in."
  end
end

def user_sign_in
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
end
