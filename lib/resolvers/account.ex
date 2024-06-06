defmodule Abscore.Resolvers.Account do
  def find_user(_parent, %{id: id}, _resolution) do
    {:ok, %{id: id}}
  end
end
