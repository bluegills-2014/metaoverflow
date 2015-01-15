require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "Get #index" do
    before {get :index}
    it{should render_template("users/index")}
  end

  describe 'Get #new' do
    before {get :new}
    it{ should render_template('users/new')}
  end

  # describe 'Get #show' do
  #   before {get :show}
  #   it{ should render_template('users/show')}
  # end
end
