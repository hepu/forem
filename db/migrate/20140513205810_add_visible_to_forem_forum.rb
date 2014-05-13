class AddVisibleToForemForum < ActiveRecord::Migration
  def change
    add_column :forem_forums, :visible, :boolean
  end
end
