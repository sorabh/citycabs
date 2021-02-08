class City < ApplicationRecord
  has_many :cabs
  has_many :users
  has_many :trips, through: :cabs
end
