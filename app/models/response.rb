class Response < ActiveRecord::Base
  include PostedAt

  belongs_to :respondable, polymorphic: true
  has_many :votes, as: :votable
  belongs_to :user

  validates :content, :user_id, :respondable_id, presence: true
  validates :content, length: { maximum: 10000 }
end
