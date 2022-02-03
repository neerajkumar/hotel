json.extract! room, :id, :room_number, :floor, :occupied, :created_at, :updated_at
json.url room_url(room, format: :json)
