module QuestionsHelper
  def truncate_content(question, number)
    if question.content.length > number
      (question.content[0..number] + " " + link_to("... continue reading", question)).html_safe
    else
      question.content.html_safe
    end
  end
end
