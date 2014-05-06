class AddCommunityIdToForemForum < ActiveRecord::Migration
  def change
    add_column :forem_forums, :community_id, :integer
    add_index :forem_forums, :community_id
  end
end
