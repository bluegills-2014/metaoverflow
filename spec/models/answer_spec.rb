require 'rails_helper'

RSpec.describe Answer, :type => :model do
  let(:answer){Answer.new}
  describe "checks associations" do
    it { expect(answer).to belong_to(:user)}
    it { expect(answer).to belong_to(:question)}
    it { expect(answer).to have_many(:votes)}
    it { expect(answer).to have_many(:responses)}
  end

  describe "checks inclusion of posted at module" do
    it "checks set posted at method" do
      expect(answer.set_posted_at.to_date).to eq(Time.now.to_date)
    end
  end

end
