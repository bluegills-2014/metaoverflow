class User < ActiveRecord::Base
  has_many :responses
  has_many :votes
  has_many :answers
  has_many :questions
  has_many :tags, through: :questions

  validates :username, uniqueness: true, presence: true
  validates :email, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

  has_secure_password
end
