class Resort < ApplicationRecord
  belongs_to :country
  has_many :groups
  has_one_attached :photo
end
