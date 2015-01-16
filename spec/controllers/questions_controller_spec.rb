require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe "Get #index" do
    let(:index) {get :index}
    it{expect(index).to render_template("questions/index")}
  end

  # describe 'GET#show' do
  #   before {get :show}
  #   it{should render_template("questions/show")}
  # end

end
