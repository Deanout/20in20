json.extract! product, :id, :size_id, :toppings_id, :name, :description, :gluten_free, :vegan, :vegetarian, :kosher, :available, :catering, :featured, :created_at, :updated_at
json.url product_url(product, format: :json)
