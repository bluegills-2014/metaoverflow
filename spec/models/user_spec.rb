require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { User.new}
  it { expect(user).to validate_presence_of(:username) }
  it { expect(user).to validate_presence_of(:email) }
  it { expect(user).to validate_uniqueness_of(:username) }
  it { expect(user).to have_many(:answers) }
  it { expect(user).to have_many(:questions) }
  it { expect(user).to have_many(:votes) }
  it { expect(user).to have_many(:responses) }
  it { expect(user).to have_many(:tags) }
  it { expect(user).to allow_value('text@email.com').for(:email) }
  it { expect(user).to_not allow_value('textemail.com').for(:email) }
  it { expect(user).to have_secure_password }


end
