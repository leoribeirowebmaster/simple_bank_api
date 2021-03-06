# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :simple_bank_api,
  ecto_repos: [SimpleBankApi.Repo]

# Guardian config
config :simple_bank_api, SimpleBankApi.Guardian,
       issuer: "SimpleBankApi",
       secret_key: "WhEiOu+GWegC/SgOs4KSuHnyjl5mGPN3F5cJtaB4i+nGLwqiWR94SrJEkBacwG6E"

# Configures the endpoint
config :simple_bank_api, SimpleBankApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "oCBYrxv2KtBCj59Peaes8BnSkRp+q9ng1TCX4PzRUaJmSBPvfZXz5xqFP+fLDFyF",
  render_errors: [view: SimpleBankApiWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: SimpleBankApi.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
