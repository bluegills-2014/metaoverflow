require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe "Get #index" do
    let(:index) {get :index}
    it{expect(index).to render_template("questions/index")}
  end

end
