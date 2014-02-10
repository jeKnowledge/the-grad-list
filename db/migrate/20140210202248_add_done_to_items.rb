class AddDoneToItems < ActiveRecord::Migration
  def change
    add_column :items, :done, :integer
  end
end
