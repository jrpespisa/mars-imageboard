describe Vote do
  it { should belong_to :image }
  it { should belong_to :user }

  it { should have_valid(:vote).when(true, false, 1, 0) }
  it { should_not have_valid(:vote).when(nil, "") }
end
