class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :entry
      t.string :tags

      t.timestamps
    end
  end
end
