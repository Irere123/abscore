defmodule Abscore.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      AbscoreWeb.Telemetry,
      Abscore.Repo,
      {DNSCluster, query: Application.get_env(:abscore, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Abscore.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Abscore.Finch},
      # Start a worker by calling: Abscore.Worker.start_link(arg)
      # {Abscore.Worker, arg},
      # Start to serve requests, typically the last entry
      AbscoreWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Abscore.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    AbscoreWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
