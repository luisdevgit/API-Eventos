json.extract! venue, :id, :name, :location, :event_id, :created_at, :updated_at
json.url venue_url(venue, format: :json)
