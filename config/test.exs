use Mix.Config

# We run a server during test for Wallaby integration testing.
config :happy_trees_server, HappyTreesServer.Endpoint,
  http: [port: 4001],
  server: true,
  secret_key_base: "0123456789012345678901234567890123456789012345678901234567890123456789"

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :happy_trees_server, HappyTreesServer.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "happy_trees_server_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :happy_trees_server, :sql_sandbox, true
