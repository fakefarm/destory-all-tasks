class AddPuntTimeToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :punt_default, :string
  end
end
