class CreateUserDiscussions < ActiveRecord::Migration
  def change
    create_table :user_discussions do |t|
      t.references :user, null: false
      t.references :discussion, null: false

      t.timestamps
    end
  end
end
