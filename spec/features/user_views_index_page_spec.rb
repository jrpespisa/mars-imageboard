feature "user views index page" do
  before do
    rover = FactoryGirl.create(:rover)
  end

  scenario "user visits index page and sees title and rover descriptions" do
    visit "/"

    expect(page).to have_content "Mars Imageboard"
    expect(page).to have_content "Opportunity"
  end
end
