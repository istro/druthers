class QuestionAndUserNotNullForDiscussions < ActiveRecord::Migration
  def change
  	change_column :discussions, :question, :string, null: false
  	change_column :discussions, :user_id, :integer, null: false
  end
end
