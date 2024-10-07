json.extract! device, :id, :name, :version, :status, :category_id, :restaurant_id, :created_at, :updated_at
json.url restaurant_device_path(device.restaurant.id, device, format: :json)
