require 'rails_helper'

RSpec.describe UsersController, :type => :controller do
  describe "#index" do
    it "will render the index page" do
      get :index
      expect(:index).to render_template("users/index")
    end
  end
end
