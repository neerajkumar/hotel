class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :room_number
      t.string :floor
      t.boolean :occupied

      t.timestamps
    end
  end
end
