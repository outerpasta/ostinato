# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ostinato,
  ecto_repos: [Ostinato.Repo]

# Configures the endpoint
config :ostinato, Ostinato.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o0BIFCyDa8+igc/fWyaV+MW78rwJWYOSGpbv8K4PipyB1JYaXCj2dJW1oP1pKDZE",
  render_errors: [view: Ostinato.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ostinato.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Ostinato.User,
  repo: Ostinato.Repo,
  module: Ostinato,
  logged_out_url: "/",
  email_from_name: "admin",
  email_from_email: "admin@example.com",
  opts: [:rememberable, :invitable, :confirmable, :trackable, :unlockable_with_token, :lockable, :recoverable, :authenticatable]
# %% End Coherence Configuration %%

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
