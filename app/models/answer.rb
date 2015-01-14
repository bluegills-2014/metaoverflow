class Answer < ActiveRecord::Base
  has_many :votes, as: :votable
  has_many :responses, as: :respondable
end
