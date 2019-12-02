class CreateReadMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :read_messages do |t|
      t.references :user, foreign_key: true
      t.references :group, foreign_key: true
      t.integer :no_of_read_messages

      t.timestamps
    end
  end
end
