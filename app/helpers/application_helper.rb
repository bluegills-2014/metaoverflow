module ApplicationHelper
  def format_date(date)
    date.strftime("on %m/%d/%Y at %I:%M%p")
  end

  def current_user_upvoted(model)
    'upvoted' if model.votes.find_by(user_id: current_user.id, votable_id: model.id, votable_type: model.class)
  end
end
