class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :solution
      t.references :user

      t.timestamps
    end
    add_index :comments, :solution_id
    add_index :comments, :user_id
  end
end
