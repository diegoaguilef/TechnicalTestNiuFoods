require 'net/http'
require 'json'
require 'uri'

# URL base de la API
API_BASE_URL = 'http://localhost:3000'
@auth_token = nil
def get_auth_token
  uri = URI("#{API_BASE_URL}/users/sign_in.json")
  http = Net::HTTP.new(uri.host.to_s, uri.port)
  http.use_ssl = true if uri.scheme == 'https'

  request = Net::HTTP::Post.new(uri.path.to_s, {
    'Content-Type' => 'application/json',
    'Accept' => 'application/json'
  })

  request.body = {
    user: {
      email: 'admin@niufoods.cl',
      password: 'admin123'
    }
  }.to_json

  response = http.request(request)
  response.header['Authorization']
end

@auth_token ||= get_auth_token
def fetch_restaurants

  uri = URI("#{API_BASE_URL}/restaurants.json")
  http = Net::HTTP.new(uri.host.to_s, uri.port)
  http.use_ssl = true if uri.scheme == 'https'

  response = http.get(uri.path.to_s, {
    'Content-Type' => 'application/json',
    'Authorization' => @auth_token
  })
  JSON.parse(response.body)
end

def fetch_devices(restaurant_id)
  uri = URI("#{API_BASE_URL}/restaurants/#{restaurant_id}/devices.json")
  http = Net::HTTP.new(uri.host.to_s, uri.port)
  http.use_ssl = true if uri.scheme == 'https'

  response = http.get(uri.path.to_s, {
    'Content-Type' => 'application/json',
    'Authorization' => get_auth_token
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
    'Authorization' => @auth_token
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
    'Authorization' => @auth_token
  })

  request.body = device.to_json

  response = http.request(request)
  puts "#{response.code} #{response.message}"
end

# restaurant id = 3
device = {
  "id" => 23,
  "name" => "Ricoh 2",
  "version" => 1.0,
  "status" => "error",
  "category_id" => 2,
  "restaurant_id" => 3,
  "updates_attributes" => [
    {

      "name" => "Revision 1",
      "version" => 1.0,
      "status" => 'active',
      "details" => 'edf9iehubgtijw3efngberynigowefw'
    }
  ]
}


loop do
  update_device(device['restaurant_id'], device)
  sleep 5 # Intervalo de tiempo en segundos
  statuses = %w[active maintenance warning error]
  revision = rand(1..100)
  version = rand(1.0..10.0).round(2)
  device['updates_attributes'].append(
    {
      "name" => "Revision #{revision}",
      "version" => version,
      "status" => statuses.sample,
      "details" => "#{version} apply_device_update example test with revision #{revision}"
    }
  )
end