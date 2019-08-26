# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :phx_pow,
  ecto_repos: [PhxPow.Repo]

# Configures the endpoint
config :phx_pow, PhxPowWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "isdyZkHVrAZ0aU7nyWEHT8ESWEk9fdVgfKtdE698OldaLbMQLlRpwEulIcMkz84e",
  render_errors: [view: PhxPowWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhxPow.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :phx_pow, :pow,
  user: PhxPow.Users.User,
  repo: PhxPow.Repo,
  extensions: [PowResetPassword, PowEmailConfirmation],
  controller_callbacks: Pow.Extension.Phoenix.ControllerCallbacks,
  web_module: PhxPowWeb

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
