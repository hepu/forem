class AddMovementIdToForemCategory < ActiveRecord::Migration
  def change
    add_column :forem_categories, :movement_id, :integer
    add_index :forem_categories, :movement_id
  end
end
