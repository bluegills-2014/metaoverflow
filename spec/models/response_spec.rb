require 'rails_helper'

RSpec.describe Response, :type => :model do
    let (:response){Response.new}
    describe "check validations" do
        it { expect(response).to belong_to(:user)}
        it { expect(response).to have_many(:votes)}
    end

    describe "validate presence" do
        it { expect(response).to validate_presence_of(:user_id) }
        it { expect(response).to validate_presence_of(:content) }
        it { expect(response).to validate_presence_of(:respondable_id) }
    end

    describe "checks inclusion of posted at module" do
        it "checks set posted at method" do
          expect(response.set_posted_at.to_date).to eq(Time.now.to_date)
      end
  end
end
