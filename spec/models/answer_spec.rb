require 'rails_helper'

RSpec.describe Answer, :type => :model do
  it { should belong_to(:user)}
  it { should belong_to(:question)}
  it { should have_many(:votes)}
  it { should have_many(:responses)}
end
