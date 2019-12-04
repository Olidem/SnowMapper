class UpdateReadmessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :read_messages, :group_id
    remove_column :read_messages, :no_of_read_messages
    add_reference :read_messages, :message, foreign_key: true
    add_column :read_messages, :read, :boolean, default: false
  end
end
