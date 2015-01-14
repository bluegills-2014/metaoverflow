class Response < ActiveRecord::Base
  belongs_to :respondable, polymorphic: true
  has_many :votes, as: :votable
  belongs_to :user
end
