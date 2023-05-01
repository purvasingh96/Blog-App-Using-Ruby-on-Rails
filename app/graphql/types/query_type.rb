module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.


    field :list_all_posts, [PostType], null:false, description: 'List of posts on the blog'     
    def list_all_posts
      return Post.all
    end

    field :list_all_users, [UserType], null:false, description: 'List of all users blogging'
    def list_all_users
      return User.all
    end

    field :list_all_comments, [CommentType], null:false, description: 'List of all comments'
    def list_all_comments
      return Comment.all
    end

  end
end
