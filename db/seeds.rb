# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


(0..5).each do |floor_number|
  puts "floor_number: #{floor_number}"
  (0..19).each do |room_number|
    puts "room_number: #{room_number}"
    next if Room.find_by(room_number: room_number, floor: floor_number)

    Room.find_or_create_by(room_number: room_number, floor: floor_number, occupied: false)
  end
end
