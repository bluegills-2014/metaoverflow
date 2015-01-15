class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers
  has_many :question_tags
  has_many :tags, through: :question_tags
  has_many :votes, as: :votable
  has_many :responses, as: :respondable

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 90, minimum: 6 }
  validates :content, presence: true, uniqueness: true, length: { maximum: 5000, minimum: 10 }


  def set_posted_at
    self.posted_at = self.created_at
    self.save
  end

  def posted_at
    super.strftime("on %m/%d/%Y at %I:%M%p")
  end

  def first(number)
    if self.content.length > number
      self.content[0..number] + "<a id=\"continueReading\" href='/blogs/#{self.id}'>...continue reading</a>"
    else
      self.content
    end
  end
end
