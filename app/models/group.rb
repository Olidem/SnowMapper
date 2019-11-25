class Group < ApplicationRecord
  belongs_to :resort
  has_many :messages
  has_one_attached :photo
end
