class AddVisibleToForemCategory < ActiveRecord::Migration
  def change
    add_column :forem_categories, :visible, :boolean
  end
end
