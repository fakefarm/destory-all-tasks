class AddTaskCounterIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :task_counter_id, :integer
  end
end
