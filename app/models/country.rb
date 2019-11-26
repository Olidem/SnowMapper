class Country < ApplicationRecord
  has_many :resorts
  has_one_attached :photo
end
