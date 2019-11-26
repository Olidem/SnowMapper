class AddLockedToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :locked, :boolean, default: false
  end
end
