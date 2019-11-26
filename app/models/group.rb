class Group < ApplicationRecord
  belongs_to :resort
  has_many :messages, dependent: :destroy
  has_one_attached :photo
  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :meetings
end
