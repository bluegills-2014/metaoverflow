require 'rails_helper'

RSpec.describe Response, :type => :model do
    let (:response){Response.new}
    it { expect(response).to belong_to(:user)}
    it { expect(response).to have_many(:votes)}

end
