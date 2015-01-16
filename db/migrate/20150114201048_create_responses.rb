class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.references :user, index: true
      t.text :content
      t.datetime :posted_at
      t.references :respondable, polymorphic: true, index: true

      t.timestamps
    end

    add_index :responses, :respondable_id # Do we need this with index: true on line 7?
  end
end
