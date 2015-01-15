class User < ActiveRecord::Base
  has_many :responses
  has_many :questions
  has_many :votes
  has_many :answers
  has_many :tags, through: :questions

  has_secure_password
end
