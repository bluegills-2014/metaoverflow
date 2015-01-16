class ResponsesController < ApplicationController
  before_action :check_if_answer
  before_action :set_question, only: [:edit, :new, :create, :destroy]
  before_action :authenticate_user, only: [:create, :new]

  def new
    @response = Response.new
  end

  def create
    @response = Response.new(params_answer)
    if @response.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def update
  end


  def edit
  end

  def destroy
  end

  private

  def check_if_answer
    @answer = Answer.find(params[:answer_id]) if params[:answer_id]
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def params_answer
    if @answer
      params.require(:response).permit(:content).merge(respondable_id: @answer.id, respondable_type: 'Answer', user_id: current_user.id)
    else
      params.require(:response).permit(:content).merge(respondable_id: @question.id, respondable_type: 'Question', user_id: current_user.id)
    end
  end
end
