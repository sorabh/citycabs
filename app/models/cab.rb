class Cab < ApplicationRecord
  enum state: [ :idle, :on_trip ]
  has_many :trips
  belongs_to :city

  validates_inclusion_of :state, in: states
  scope :idle_cabs, -> { where(state: :idle) }
end
