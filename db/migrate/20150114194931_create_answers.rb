class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.text :content
      t.boolean :best
      t.date :posted_at

      t.timestamps
    end
  end
end
