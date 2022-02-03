require 'rails_helper'

RSpec.describe Room, type: :model do
  # Validations
  context 'when room is already occupied' do
    let(:room) { Room.create(room_number: 100, floor: '1', occupied: true) }

    subject { room.update(occupied: true) }

    it 'returns error' do
      subject

      expect(room).to be_invalid
      expect(room.errors.full_messages).to include("Can't reserve already occupied room")
    end
  end
end
