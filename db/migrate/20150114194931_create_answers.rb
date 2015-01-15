class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.belongs_to :question
      t.belongs_to :user
      t.text :content
      t.boolean :best
      t.datetime :posted_at

      t.timestamps
    end
  end
end
