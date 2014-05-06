class AddModerationDefaultValuesToForemForum < ActiveRecord::Migration
  def change
    add_column :forem_forums, :moderate_forem_topics, :boolean, default: nil
    add_column :forem_forums, :moderate_forem_posts, :boolean, default: nil
  end
end
