class AddCommentableIdAndCommentableTypeToCommentAndRemoveSolutionId < ActiveRecord::Migration
  def change
    remove_column :comments, :solution_id
    add_column :comments, :commentable_id, :integer
    add_column :comments, :commentable_type, :string
  end
end
