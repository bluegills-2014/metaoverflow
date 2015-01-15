class QuestionsController < ApplicationController
  def index
    @questions = Question.order(:posted_at).limit(25) # Come back and implement pagination?
  end

  def show
    @question = Question.find(params[:id])
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      @question.set_posted_at
      redirection_to action: questions_path # Not sure if correct path?
    else
      render 'new' # Need to flash errors here
    end
  end

  def edit

  end

  private

  def question_params
    params.require(:question).permit(:title, :content)
  end
end
