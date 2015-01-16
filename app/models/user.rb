class User < ActiveRecord::Base
  has_many :responses
  has_many :votes
  has_many :answers
  has_many :questions
  has_many :tags, through: :questions

  validates :username, uniqueness: true, presence: true

  validates :slug, uniqueness: true
  validates :email, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  # validates_format_of :username, :without => /[^!@#$%^&*()]/
  validates_format_of :username, :without => /\s/
  has_secure_password

  before_create :create_slug

  def create_slug
    self.slug = username.gsub(/\W/,"_")
  end

  def to_param
    slug
  end
end
