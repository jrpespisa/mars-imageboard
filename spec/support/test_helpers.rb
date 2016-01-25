require "rails_helper"
include Devise::Controllers::Helpers

module TestHelpers
  def test_seeder
    @rover1 = FactoryGirl.create(:rover, name: "Rover_1")
    @rover2 = FactoryGirl.create(:rover, name: "Rover_2")
    @rover3 = FactoryGirl.create(:rover, name: "Rover_3")

    @image1 = FactoryGirl.create(:image, name: "Image_1", rover_id: @rover1.id)
    @image2 = FactoryGirl.create(:image, name: "Image_2", rover_id: @rover2.id)
    @image3 = FactoryGirl.create(:image, name: "Image_3", rover_id: @rover3.id)

    @user = FactoryGirl.create(:user)
  end

  def sign_in
    visit new_user_session_path
    fill_in "Email", with: @user.email
    # fill_autocomplete("user_password", with: "#{@user.password}")
    fill_in "Password", with: @user.password
    click_button "Sign In"
  end

  def comment
    click_on "Rover_1"
    page.first(".link").click
    click_link "Add Comment"
    fill_in "Comment", with: "Here is a test comment"
    click_button "Create Comment"
  end

  # def fill_autocomplete(field, options = {})
  #   fill_in field, with: options[:with]
  #
  #   page.execute_script %Q{ $('##{field}').trigger('focus') }
  #   page.execute_script %Q{ $('##{field}').trigger('keydown') }
  #   selector = %Q{ul.ui-autocomplete li.ui-menu-item a:contains("#{options[:select]}")}
  #
  #   page.should have_selector('ul.ui-autocomplete li.ui-menu-item a')
  #   page.execute_script %Q{ $('#{selector}').trigger('mouseenter').click() }
  # end
  #

end
