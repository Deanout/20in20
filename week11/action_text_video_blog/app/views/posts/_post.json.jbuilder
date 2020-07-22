json.extract! post, :id, :title, :views, :created_at, :updated_at
json.url post_url(post, format: :json)
