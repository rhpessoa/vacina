# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :vacina,
  ecto_repos: [Vacina.Repo]

# Configures the endpoint
config :vacina, VacinaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "F5dN0raxvy4S5wDWKIaws9cnNKAaJqt0Ed8+0rdkiab7s0eY/HtBmf7V+u6mGaWY",
  render_errors: [view: VacinaWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Vacina.PubSub,
  live_view: [signing_salt: "fRRL9kAc"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
