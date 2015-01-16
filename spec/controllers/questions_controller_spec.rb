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

  describe 'Post #create' do
    describe "valid data" do
        let(:question){{
          title: Faker::Lorem.sentence,
          content: Faker::Lorem.paragraph(3)
        }}
        context "redirect to new question" do
          it{expect(post :create, question: question).to redirect_to Question.last}
        end
      end


      describe "invalid data" do
        let(:question){{
          title: nil,
          content: Faker::Lorem.paragraph(3)
        }}

        context "rerednder new question form" do
          it{expect(post :create, question: question).to render_template('questions/new')}
        end

      end
    end

  end
