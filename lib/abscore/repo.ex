defmodule Abscore.Repo do
  use Ecto.Repo,
    otp_app: :abscore,
    adapter: Ecto.Adapters.Postgres
end
