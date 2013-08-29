class AddFeatureTagToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :feature, :boolean
  end
end
