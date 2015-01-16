require 'rails_helper'

RSpec.describe Question, :type => :model do
  let(:question){Question.new}
  context "Checks associations" do
    it { expect(question).to have_many(:answers) }
    it { expect(question).to have_many(:question_tags) }
    it { expect(question).to have_many(:tags) }
    it { expect(question).to have_many(:votes) }
    it { expect(question).to have_many(:responses) }
  end

  context "Checks validations" do

    describe "checks presence" do
      it { expect(question).to validate_presence_of(:title) }
      it { expect(question).to validate_presence_of(:user_id) }
      it { expect(question).to validate_presence_of(:content) }
    end

    describe "checks uniqueness" do
      it { expect(question).to validate_uniqueness_of(:title) }
    end

    describe "checks length" do
      # it { expect(question).to validate_length_of(:title).is_at_most(90) }
      # it { expect(question).to validate_length_of(:content).is_at_most(10000) }
    end
  end

  describe "checks inclusion of posted at module" do
    it "checks set posted at method" do
      expect(question.set_posted_at.to_date).to eq(Time.now.to_date)
    end
  end
end
