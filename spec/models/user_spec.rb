require 'rails_helper'

RSpec.describe User, :type => :model do
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:username) }
  it { should have_many(:answers) }
  it { should have_many(:questions) }
  it { should have_many(:votes) }
  it { should have_many(:responses) }
  it { should have_many(:tags) }
  it { should allow_value('text@email.com').for(:email) }
  it { should_not allow_value('textemail.com').for(:email) }
  it { should have_secure_password }


end
