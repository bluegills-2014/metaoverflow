class AnswersController < ApplicationController
  before_action :set_answer, only: [:show, :update, :destroy, :edit]
  before_action :set_question, only: [:new, :create]
  before_action :authenticate_user, only: [:create, :new]

  def index
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params_answer)
    if @answer.save
      redirect_to @question
    else
      render 'new' # Need to flash errors here
    end

  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def params_answer
    params.require(:answer).permit(:content).merge(question_id: @question.id, user_id: current_user.id)
  end
end
