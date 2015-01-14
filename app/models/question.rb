class Question < ActiveRecord::Base
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :votes, as: :votable
  has_many :responses, as: :respondable
end
