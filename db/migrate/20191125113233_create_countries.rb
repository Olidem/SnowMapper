class CreateCountries < ActiveRecord::Migration[5.2]
  def change
    create_table :countries do |t|
      t.string :name
      t.integer :slope_length
      t.string :cost
      t.string :continent

      t.timestamps
    end
  end
end
