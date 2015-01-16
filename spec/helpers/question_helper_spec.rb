RSpec.describe ApplicationHelper, :type => :helper do
  describe "Question Helper" do
      let(:question){Question.new({
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph(5),
        })}
      it "" do
      end
  end
end
