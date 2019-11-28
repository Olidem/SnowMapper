class Group < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :membership_requests
  belongs_to :resort
  has_one_attached :photo
  has_many :users, through: :memberships
  has_many :meetings
end
