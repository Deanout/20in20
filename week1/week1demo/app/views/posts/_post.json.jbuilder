json.extract! post, :id, :title, :body, :views, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)
