class ResponsesController < ApplicationController
  before_action :set_question
  before_action :check_if_answer

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
    @answer = params[:answer_id] if params[:answer_id]
  end

  def set_question
    @question = Question.find(params[:question_id])
  end

  def params_answer
    if @answer
      params.require(:answer).permit(:content).merge(respondable_id: @answer.id, respondable_type: 'Answer', user_id: current_user.id)
    else
      params.require(:answer).permit(:content).merge(respondable_id: @question.id,
        respondable_type: 'Question', user_id: current_user.id)
    end
  end
end
