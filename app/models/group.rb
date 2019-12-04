class Group < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :membership_requests, dependent: :destroy
  belongs_to :resort
  has_one_attached :photo
  has_many :users, through: :memberships
  has_many :meetings, dependent: :destroy
  has_many :read_messages, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
