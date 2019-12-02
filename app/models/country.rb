class Country < ApplicationRecord
  has_many :resorts, dependent: :destroy
  has_one_attached :photo
end
