class CreateResorts < ActiveRecord::Migration[5.2]
  def change
    create_table :resorts do |t|
      t.string :name
      t.text :description
      t.string :address
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
