class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.references :question
      t.references :tag
    end

    add_index :question_tags, [:question_id, :tag_id]
    add_index :question_tags, :tag_id
  end
end

