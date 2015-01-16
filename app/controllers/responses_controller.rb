class ResponsesController < ApplicationController
  before_action :set_question, only: [:new, :create]
  before_action :check_if_answer

  private

  def check_if_answer
  end

  def set_question
    @question = Question.find(params[:question_id])
  end
end
