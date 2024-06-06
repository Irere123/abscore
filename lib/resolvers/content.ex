defmodule Abscore.Resolvers.Content do
  def list_posts(_parent, _args, _resolution) do
    {:ok, []}
  end

  def create_post(_parent, _args, %{context: %{current_user: _user}}) do
    %{}
  end

  def create_post(_parent, _args, _resolution) do
    {:error, "Access denied"}
  end
end
