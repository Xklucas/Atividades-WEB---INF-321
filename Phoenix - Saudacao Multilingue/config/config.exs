import Config

config :hello,
  generators: [timestamp_type: :utc_datetime]

config :hello, HelloWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: HelloWeb.ErrorHTML, json: HelloWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Hello.PubSub,
  live_view: [signing_salt: "7CuzTHI6"]

config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

import_config "#{config_env()}.exs"
