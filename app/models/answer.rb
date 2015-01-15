class Answer < ActiveRecord::Base
  include PostedAt

  belongs_to :user
  belongs_to :question
  has_many :votes, as: :votable
  has_many :responses, as: :respondable
end
