require "spec_helper"

feature "user edits account information" do
  scenario "user successfully changes account information" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    click_link "Edit Account"
    fill_in "Last Name", with: "Smith"
    fill_in "Current Password", with: user.password
    click_button "Update"

    expect(page).to have_content "Account changes saved!"
    expect(page).to have_content "Smith"
  end

  scenario "user enters the wrong password" do
    user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
    click_link "Edit Account"
    fill_in "Last Name", with: "Smith"
    fill_in "Current Password", with: "WrongPassword"
    click_button "Update"

    expect(page).to_not have_content "Account changes saved!"
    expect(page).to_not have_content "Smith"
    expect(page).to have_content "is invalid"
  end
end
