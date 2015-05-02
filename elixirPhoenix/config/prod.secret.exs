use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :elixirPhoenix, ElixirPhoenix.Endpoint,
  secret_key_base: "R2rnWTCgs/84BBiUk7f7FEWWGUa/4fiEKJ5S4UO+8Ei3ha12hCsYSay7H1flireH"

# Configure your database
config :elixirPhoenix, ElixirPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "elixirPhoenix_prod"
