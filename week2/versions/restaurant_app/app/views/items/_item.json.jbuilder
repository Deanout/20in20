json.extract! item, :id, :name, :description, :price, :catering_item, :created_at, :updated_at
json.url item_url(item, format: :json)
