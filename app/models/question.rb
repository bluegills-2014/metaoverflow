class Question < ActiveRecord::Base
  include PostedAt

  belongs_to :user
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :votes, as: :votable
  has_many :responses, as: :respondable

  validates :title, :content, :user_id, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 90 }
  validates :content, length: { maximum: 10000 }
end
