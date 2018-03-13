json.extract! location, :id, :name, :store_number, :address, :city, :state, :zipcode, :latitude, :longitude, :created_at, :updated_at
json.url location_url(location, format: :json)
