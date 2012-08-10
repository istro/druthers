class RemoveSlugFromDiscussions < ActiveRecord::Migration
  def change
    remove_column :discussions, :slug
  end
end
