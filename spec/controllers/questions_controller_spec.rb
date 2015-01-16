require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do
  describe "Get #index" do
    let(:index) {get :index}
    it{expect(index).to render_template("questions/index")}
  end

  describe 'Get #new' do
    let(:new) {get :new}
    it{ expect(new).to render_template('questions/new')}
  end

end
