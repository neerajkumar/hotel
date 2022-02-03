class Room < ApplicationRecord

  #validate :room_reservation, on: :update

  private

  def room_reservation
    byebug
    errors.add(:base, "Can't reserve already occupied room") if changes.present? && occupied && changes[:occupied] == [true, true]
  end
end
