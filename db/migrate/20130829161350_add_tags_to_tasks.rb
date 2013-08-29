class AddTagsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :tags, :string
  end
end
