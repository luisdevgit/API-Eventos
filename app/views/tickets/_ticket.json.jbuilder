json.extract! ticket, :id, :seat, :name, :price, :venue_id, :created_at, :updated_at
json.url ticket_url(ticket, format: :json)
