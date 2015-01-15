class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :votes, as: :votable
  has_many :responses, as: :respondable

  def set_posted_at
    self.posted_at = self.created_at
    self.save
  end
end
