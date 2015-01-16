require 'rails_helper'

RSpec.describe Vote, :type => :model do
    let(:vote) {Vote.new}
    it { expect(vote).to belong_to(:user)}
end
