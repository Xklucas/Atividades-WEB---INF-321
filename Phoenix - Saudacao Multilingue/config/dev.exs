import Config

config :hello, HelloWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "qjYqMtKYTrR4jYzmuuXaF3oKHa6E+svT8TTOX+u6EV88vaq1CqYlLd1+vocn6/aC",
  watchers: []

config :hello, dev_routes: true

config :logger, :default_formatter, format: "[$level] $message\n"

config :phoenix, :stacktrace_depth, 20

config :phoenix, :plug_init_mode, :runtime

config :phoenix_live_view,
  debug_heex_annotations: true,
  debug_attributes: true,
  enable_expensive_runtime_checks: true
