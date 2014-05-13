class DefaultVisibilityOfForumsAndCategories < ActiveRecord::Migration
  def up
    change_column_default(:forem_forums, :visible, true)
    change_column_default(:forem_categories, :visible, true)
    Forem::Forum.find_each do |f|
      f.visible = true
      f.save
    end
    Forem::Category.find_each do |c|
      c.visible = true
      c.save
    end
  end

  def down
    change_column_default(:forem_forums, :visible, nil)
    change_column_default(:forem_categories, :visible, nil)
  end
end
