require "rails_helper"

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
end
