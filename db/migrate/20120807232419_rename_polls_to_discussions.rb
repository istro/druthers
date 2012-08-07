class RenamePollsToDiscussions < ActiveRecord::Migration
  def change
  	rename_table :polls, :discussions
  end
end
