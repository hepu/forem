class AddDistrictCodeToForemForum < ActiveRecord::Migration
  def change
    add_column :forem_forums, :district_code, :string
    add_index :forem_forums, :district_code
  end
end
