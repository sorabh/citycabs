class Trip < ApplicationRecord
  belongs_to :cab
  belongs_to :user

  before_save :validate_cab_status
  after_create :mark_cab_on_trip
  after_update :mark_cab_idle, if: :trip_complete?

  private

  def trip_complete?
    end_time.present?
  end

  def validate_cab_status
    cab.idle?
  end

  def mark_cab_on_trip
    cab.on_trip!
  end

  def mark_cab_idle
    cab.idle!
  end
end
