import Config

# Ativo o servidor da release pelo PHX_SERVER definido no Render.
if System.get_env("PHX_SERVER") do
  config :hello, HelloWeb.Endpoint, server: true
end

if config_env() == :dev do
  config :hello, HelloWeb.Endpoint,
    http: [port: String.to_integer(System.get_env("PORT", "4000"))]

  config :hello, HelloWeb.Endpoint,
    live_reload: [
      web_console_logger: true,
      patterns: [
        ~r"priv/static/(?!uploads/).*\.(js|css|png|jpeg|jpg|gif|svg)$"E,
        ~r"lib/hello_web/router\.ex$"E,
        ~r"lib/hello_web/(controllers|live|components)/.*\.(ex|heex)$"E
      ]
    ]
end

if config_env() == :prod do
  # Leio o segredo do ambiente de produção para mantê-lo fora do repositório.
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  # Uso os valores do Render para montar a URL pública e escolher a porta.
  host = System.get_env("PHX_HOST") || System.get_env("RENDER_EXTERNAL_HOSTNAME") || "localhost"
  port = String.to_integer(System.get_env("PORT", "4000"))

  config :hello, HelloWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [ip: {0, 0, 0, 0}, port: port],
    secret_key_base: secret_key_base
end
