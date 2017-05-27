# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :ashes,
  ecto_repos: [Ashes.Repo]

# Configures the endpoint
config :ashes, Ashes.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2X+LzRDSffF+9ZdHchnU+7Dg4zssxdBpd2t2SFrfLJUMY+DYnTDi3NqemQo/mAGf",
  render_errors: [view: Ashes.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ashes.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Ashes.AdminUser,
  repo: Ashes.Repo,
  module: Ashes,
  logged_out_url: "/",
  user_token: true,
  email_from_name: "Phoenix Ashes",
  email_from_email: "noreply@localhost",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, Ashes.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
