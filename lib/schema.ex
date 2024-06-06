defmodule Abscore.Schema do
  use Absinthe.Schema

  import_types(Absinthe.Type.Custom)
  import_types(Schema.AccountTypes)
  import_types(Schema.ContentTypes)

  alias Abscore.Resolvers

  query do
    @desc "Get all posts"
    field :posts, list_of(:post) do
      resolve(&Resolvers.Content.list_posts/3)
    end

    @desc "Get a user of the blog"
    field :user, :user do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Account.find_user/3)
    end
  end

  mutation do
    @desc "Create a post"
    field :create_post, type: :post do
      arg(:title, non_null(:string))
      arg(:body, non_null(:string))
      arg(:published_at, :naive_datetime)

      resolve(&Resolvers.Content.create_post/3)
    end
  end
end
