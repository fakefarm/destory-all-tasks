class CreateTaskCounters < ActiveRecord::Migration
  def change
    create_table :task_counters do |t|
      t.integer :quantity

      t.timestamps
    end
  end
end
