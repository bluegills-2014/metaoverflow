class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.belongs_to :user
      t.text :content
      t.date :posted_at
      t.references :respondable, polymorphic: true, index: true

      t.timestamps
    end

    add_index :responses, :respondable_id
  end
end
