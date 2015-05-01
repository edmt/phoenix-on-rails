use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :phoenix, Phoenix.Endpoint,
  secret_key_base: "Yl43DfEobnxJ+B02TkPCUGT4cnVs7LGhhgTsJgrNK6qYu8QLU8VvfnP3tcLCsF+i"

# Configure your database
config :phoenix, Phoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "phoenix_prod"
