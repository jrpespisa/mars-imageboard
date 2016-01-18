FactoryGirl.define do
  factory :rover do
    name "Rover"
    description "This rover was launched in July of 2003 and has been
    operational on the red planet ever since."
  end

  factory :image do
    image "Martian Landscape"
    name "Terra Meridiani"
    description "North-facing view of Terra Meridiani, some geological features
    visible."
  end
end
