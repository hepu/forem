class AddTypeToForemForum < ActiveRecord::Migration
  def change
    add_column :forem_forums, :type, :string
  end
end
