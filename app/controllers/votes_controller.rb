class VotesController < ApplicationController
  before_action :set_question

  def new
    redirect_to root_path
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end
end
