json.extract! event, :id, :name, :venue, :city, :country, :created_at, :updated_at
json.url event_url(event, format: :json)
