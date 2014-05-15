class AddSubtypeToForemForum < ActiveRecord::Migration
  def change
    add_column :forem_forums, :subtype, :string
    add_index :forem_forums, :subtype
  end
end
