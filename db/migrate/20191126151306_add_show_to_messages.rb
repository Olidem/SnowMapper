class AddShowToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :show, :boolean, null: true, default: true
  end
end
