module PostedAt
  def self.included(base)
    base.before_save :set_posted_at, on: :create
  end

  def set_posted_at
    self.posted_at = Time.now
  end
end
