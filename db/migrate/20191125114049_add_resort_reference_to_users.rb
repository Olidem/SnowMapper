class AddResortReferenceToUsers < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :resort, foreign_key: true
  end
end
