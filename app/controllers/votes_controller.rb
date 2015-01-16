class VotesController < ApplicationController
  before_action :set_question, only: [:create, :destroy]
  # before_action :set_vote, only: [:destroy]

  def new
  end

  def create
    @question.votes.find_or_create_by(params_vote)
    render json: { id: @question.id, count: @question.votes.count }
  end

  def destroy
    votes = @question.votes.find_by(params_vote)
    votes.destroy
    render json: { id: @question.id, count: @question.votes.count }
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def params_vote
    params.permit(votable_id: @question.id, votable_type: 'Question', user_id: current_user.id)
  end
end
