require 'rails_helper'

RSpec.describe Answer, :type => :model do
  let(:answer){Answer.new}
  it { expect(answer).to belong_to(:user)}
  it { expect(answer).to belong_to(:question)}
  it { expect(answer).to have_many(:votes)}
  it { expect(answer).to have_many(:responses)}
end
