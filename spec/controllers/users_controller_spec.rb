require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "Get #index" do
    let(:index) {get :index}
    it{expect(index).to render_template("users/index")}
  end

  describe 'Get #new' do
    let(:new) {get :new}
    it{ expect(new).to render_template('users/new')}
  end
end
