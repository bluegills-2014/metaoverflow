RSpec.describe ApplicationHelper, :type => :helper do
  describe "Question Helper" do

    it "Change format of datetime for AM" do
      let(:question){Question.new({
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph(5),
        })}


      expect(truncate_content(question, 10).to ()
    end
  end
end
