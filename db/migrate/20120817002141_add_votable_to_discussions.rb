class AddVotableToDiscussions < ActiveRecord::Migration
  def change
    add_column :discussions, :votable, :boolean, :default => false
  end
end
