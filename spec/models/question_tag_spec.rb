require 'rails_helper'

RSpec.describe QuestionTag, :type => :model do
  it { should belong_to(:tag) }
  it { should belong_to(:question) }

end
