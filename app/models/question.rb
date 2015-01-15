class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :votes, as: :votable
  has_many :responses, as: :respondable

  validates :title, :content, :user_id, presence: true
  validates :title, uniqueness: true
  validates :title, length: { maximum: 90, minimum: 6 }
  validates :content, length: { maximum: 10000, minimum: 10 }

  def set_posted_at
    self.posted_at = self.created_at
    self.save
  end

  def posted_at
    super.strftime("on %m/%d/%Y at %I:%M%p")
  end

  def first(number)
    if self.content.length > number
      (self.content[0..number] + " <a href='/questions/#{self.id}'>...continue reading</a>").html_safe
    else
      self.content.html_safe
    end
  end
end
