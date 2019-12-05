class AddDataToResorts < ActiveRecord::Migration[5.2]
  def change
    add_column :resorts, :data, :text
  end
end
