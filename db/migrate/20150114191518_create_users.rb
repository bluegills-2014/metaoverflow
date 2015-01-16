class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.string :location
      t.integer :age
      t.text :bio
      t.string :avatar
      t.datetime :registered_at
      t.string :slug

      t.timestamps
    end
  end
end
