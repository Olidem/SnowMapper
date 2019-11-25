class Group < ApplicationRecord
  belongs_to :resort
  has_many :messages
end
