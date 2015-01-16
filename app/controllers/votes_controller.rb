class VotesController < ApplicationController
  before_action :set_question, only: :vote_handler

  def vote_handler
    if @vote = @question.votes.find_by(params_vote)
      @vote.destroy
      render json: { id: @question.id, count: @question.votes.count }
    else
      @question.votes.create(params_vote)
      render json: { id: @question.id, count: @question.votes.count }
    end
  end

  private

  def set_question
    @question = Question.find(params[:question_id])
  end

  def params_vote
    params.permit(:votable_id, :votable_type).merge(user_id: current_user.id, votable_id: @question.id, votable_type: 'Question')
  end
end
