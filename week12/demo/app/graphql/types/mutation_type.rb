module Types
  class MutationType < Types::BaseObject
    field :create_author_mutation, mutation: Mutations::CreateAuthorMutation do
      description "Create an author using this Mutation."
    end
    field :create_post_mutation, mutation: Mutations::CreatePostMutation do
      description "Create a Post using this Mutation."
    end
    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World"
    end
  end
end
