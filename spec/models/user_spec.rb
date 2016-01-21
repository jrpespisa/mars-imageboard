require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_valid(:first_name).when('John', 'Rebecca') }
  it { should_not have_valid(:first_name).when(nil, "") }

  it { should have_valid(:last_name).when('Smith', 'Stone') }
  it { should_not have_valid(:last_name).when(nil, "") }

  it { should have_valid(:email).when('jsmith@email.com', 'rstone@email.com') }
  it { should_not have_valid(:email).when(nil, "", "user@com", "userba.com") }

  it { should have_valid(:password).when('jsmith@email.com', 'rstone@email.com') }
  it { should_not have_valid(:email).when(nil, "") }

  it "has a matching password confimation for the password" do
    user = User.new
    user.password = "password"
    user.password_confirmation = "pasword"

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
