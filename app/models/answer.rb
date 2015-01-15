class Answer < ActiveRecord::Base
  include PostedAt

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :responses, as: :respondable

  validates :content, :user_id, :question_id, presence: true
  validates :content, length: { maximum: 10000 }
end
