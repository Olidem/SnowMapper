class Country < ApplicationRecord
  has_many :resorts, dependent: :destroy
  has_many_attached :photos
end
