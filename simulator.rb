require 'net/http'
require 'json'
require 'uri'

# URL base de la API
API_BASE_URL = 'http://localhost:3000'
API_TOKEN = 'olaknwsdbuidkkcjw39qp2owdf'

def fetch_restaurants
  uri = URI("#{API_BASE_URL}/restaurants.json")
  http = Net::HTTP.new(uri.host.to_s, uri.port)
  http.use_ssl = true if uri.scheme == 'https'

  response = http.get(uri.path.to_s, {
    'Content-Type' => 'application/json',
    'Authorization' => API_TOKEN
  })
  restaurants = JSON.parse(response.body)
  puts "Restaurantes obtenidos: #{restaurants.size}"
  restaurants
end

def fetch_devices(restaurant_id)
  uri = URI("#{API_BASE_URL}/restaurants/#{restaurant_id}/devices.json")
  http = Net::HTTP.new(uri.host.to_s, uri.port)
  http.use_ssl = true if uri.scheme == 'https'

  response = http.get(uri.path.to_s, {
    'Content-Type' => 'application/json',
    'Authorization' => API_TOKEN
  })
  devices = JSON.parse(response.body)
  puts "Dispositivos obtenidos: #{devices.size}"
  devices
end

def fetch_device(restaurant_id, device_id)
  uri = URI("#{API_BASE_URL}/restaurants/#{restaurant_id}/devices/#{device_id}.json")
  http = Net::HTTP.new(uri.host.to_s, uri.port)
  http.use_ssl = true if uri.scheme == 'https'

  response = http.get(uri.path.to_s, {
    'Authorization' => API_TOKEN
  })
  devices = JSON.parse(response.body)
  devices
end

def update_device(restaurant_id, device)
  uri = URI("#{API_BASE_URL}/restaurants/#{restaurant_id}/devices/#{device['id']}.json")
  http = Net::HTTP.new(uri.host.to_s, uri.port)
  http.use_ssl = true if uri.scheme == 'https'
  request = Net::HTTP::Put.new(uri.path.to_s, {
    'Content-Type' => 'application/json',
    'Authorization' => API_TOKEN
  })

  request.body = device.to_json

  response = http.request(request)
  puts "Dispositivo atualizado #{device['id']}: #{response.code} #{response.message}"
end

fetch_restaurants.each do |restaurant|
  pp fetch_devices(restaurant['id'])
end

device = {
  "id" => 23,
  "name" => "Ricoh 2",
  "version" => 1.0,
  "status" => "error",
  "category_id" => 2,
  "restaurant_id" => 3,
  "created_at" => "2024-10-07T17:37:49.825Z",
  "updated_at" => "2024-10-07T17:37:49.825Z",
  "updates_attributes" => [
    {

      "name" => "Revision 1",
      "version" => 1.0,
      "status" => 'active',
      "details" => 'minor changes'
    },
    {
      "name" => "Revision 2",
      "version" => 1.2,
      "status" => 'error',
      "details" => 'minor changes'
    },
    {
      "name" => "Revision 3",
      "version" => 1.3,
      "status" => 'warning',
      "details" => 'minor ssss'
    }
  ]
}

update_device(device['restaurant_id'], device)