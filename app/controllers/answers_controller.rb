class AnswersController < ApplicationController
# before_action :set_answer, only: [:new, :show, :update, :destroy, :edit]

  def index
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.new(params_answer)
    if @answer.save
      @answer.set_posted_at
      redirect_to action: questions_path # Not sure if correct path?
    else
      render 'new' # Need to flash errors here
    end

  end

  private

  def set_answer
    @answer = Answer.find(params[:id])
  end

  def params_answer
    params.require(:answer).permit(:content)
  end

end
