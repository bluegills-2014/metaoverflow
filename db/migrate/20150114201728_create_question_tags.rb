class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      belongs_to :question
      belongs_to :tag
    end
  end
end
