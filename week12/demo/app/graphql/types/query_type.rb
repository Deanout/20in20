module Types
  class QueryType < Types::BaseObject
    field :posts, [Types::PostType], null: false do
      description "Query that selects all posts."
    end

    field :postsCount, Integer, null: false do
      description "Query that returns the total number of posts."
    end

    def posts
      Post.all
    end

    def postsCount
      Post.count
    end
  end
end
