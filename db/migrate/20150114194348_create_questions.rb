class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.datetime :posted_at
      t.references :user, index: true

      t.timestamps
    end
  end
end
