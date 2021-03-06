use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :simple_bank_api, SimpleBankApiWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :simple_bank_api, SimpleBankApi.Repo,
  username: "user",
  password: "senha123",
  database: "simple_bank_api_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
