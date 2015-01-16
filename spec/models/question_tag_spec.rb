require 'rails_helper'

RSpec.describe QuestionTag, :type => :model do

  let(:questiontag){QuestionTag.new}
  it {expect(questiontag).to belong_to(:tag) }
  it {expect(questiontag).to belong_to(:question) }

end
