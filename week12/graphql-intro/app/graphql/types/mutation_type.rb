module Types
  class MutationType < Types::BaseObject
    field :create_post_mutation, mutation: Mutations::CreatePostMutation
    field :create_author_mutation, mutation: Mutations::CreateAuthorMutation
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
