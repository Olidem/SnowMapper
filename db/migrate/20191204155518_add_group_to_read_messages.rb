class AddGroupToReadMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :read_messages, :group, foreign_key: true
  end
end
