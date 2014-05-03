class AddLeadershipPositionIdToForemForum < ActiveRecord::Migration
  def change
    add_column :forem_forums, :leadership_position_id, :integer
    add_index :forem_forums, :leadership_position_id
  end
end
