require 'rails_helper'

RSpec.describe QuestionTag, :type => :model do

  let(:questiontag){QuestionTag.new}
  describe "checks validations" do
    it {expect(questiontag).to belong_to(:tag) }
    it {expect(questiontag).to belong_to(:question) }
  end

  describe "validate presence" do
    it { expect(questiontag).to validate_presence_of(:tag_id) }
    it { expect(questiontag).to validate_presence_of(:question_id) }
  end

end
