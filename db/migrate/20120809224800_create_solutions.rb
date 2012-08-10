class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :text, null: false
      t.references :discussion
      t.references :user

      t.timestamps
    end
    add_index :solutions, :discussion_id
  end
end
