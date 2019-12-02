class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group
  has_many :read_messages, dependent: :destroy
end
