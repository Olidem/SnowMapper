class Group < ApplicationRecord
  belongs_to :resort
  has_many :messages
  has_one_attached :photo
  has_many :memberships
  has_many :users, through: :memberships
  has_many :meetings
end
