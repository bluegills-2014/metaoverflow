require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { User.new}

  describe "validate presence" do
    it { expect(user).to validate_presence_of(:username) }
    it { expect(user).to validate_presence_of(:email) }
  end

  describe "validate uniqueness" do
    it { expect(user).to validate_uniqueness_of(:username) }
  end

  describe "checks associations" do
    it { expect(user).to have_many(:answers) }
    it { expect(user).to have_many(:questions) }
    it { expect(user).to have_many(:votes) }
    it { expect(user).to have_many(:responses) }
    it { expect(user).to have_many(:tags) }
  end

  describe "checks email format" do
    it { expect(user).to allow_value('text@email.com').for(:email) }
    it { expect(user).to_not allow_value('textemail.com').for(:email) }
  end

  describe "checks for secure password" do
    it { expect(user).to have_secure_password }
  end

  describe "checks to param method" do
    let(:user) {User.new(username: "name")}
    it "makes chances id to user name for route" do
      expect(user.to_param).to eq(user.username)
    end
  end


end
