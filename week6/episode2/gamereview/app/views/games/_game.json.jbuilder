json.extract! game, :id, :title, :review, :rating, :created_at, :updated_at
json.url game_url(game, format: :json)
