describe Comment do
  it { should belong_to :user }
  it { should belong_to :image }

  it { should have_valid(:body).when("Sample comment") }
  it { should_not have_valid(:body).when(nil, "") }
end
