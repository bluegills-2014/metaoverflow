class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.belongs_to :user
      t.references :votable, polymorphic: true, index: true

      t.timestamps null: false
    end

    add_index :votes, :votable_id
  end
end
