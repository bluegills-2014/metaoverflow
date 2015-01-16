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

  describe 'Post #create' do
    describe "valid data" do
      let(:user){{
        username: Faker::Name.name,
        password: "password",
        password_confirmation: "password",
        email: Faker::Internet.email,
        location: Faker::Address.city,
        age: rand(15..99),
        bio: Faker::Lorem.paragraph,
        avatar: rand(1..10).to_s,
        registered_at: Faker::Time.date
        }}
        context "redirect to new user" do
          it{expect(post :create, user: user).to redirect_to User.last}
        end
    end


    describe "invalid data" do
      let(:user){{
        username: nil,
        password: "password",
        password_confirmation: "password",
        email: Faker::Internet.email,
        location: Faker::Address.city,
        age: rand(15..99),
        bio: Faker::Lorem.paragraph,
        avatar: rand(1..10).to_s,
        registered_at: Faker::Time.date
        }}

        context "rerednder new user form" do
          it{expect(post :create, user: user).to render_template('users/new')}
        end

    end
  end
end
