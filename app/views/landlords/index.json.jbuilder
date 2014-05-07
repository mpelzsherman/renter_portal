json.array!(@landlords) do |landlord|
  json.extract! landlord, :id
  json.url landlord_url(landlord, format: :json)
end
