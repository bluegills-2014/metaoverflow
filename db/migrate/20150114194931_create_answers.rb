class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question, index: true
      t.references :user, index: true
      t.text :content
      t.boolean :best
      t.datetime :posted_at

      t.timestamps
    end

    add_index :answers, [:question_id, :user_id]
  end
end
