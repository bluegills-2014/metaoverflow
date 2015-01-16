class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy, :edit]
  before_action :authenticate_user, only: [:create, :new]
  def index
    @questions = Question.order(:posted_at).limit(25) # Come back and implement pagination?
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = session[:user_id]
    if @question.save
      redirect_to @question
    else
      render 'new' # Need to flash errors here
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Question was updated successfully."'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to root_path
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params # Gonna have to add more stuff here
    # Have to add current_user.id
    params.require(:question).permit(:title, :content)
  end
end
