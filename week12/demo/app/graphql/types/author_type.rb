module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :post, [Types::PostType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
