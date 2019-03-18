use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :live_markdown, LiveMarkdownWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :live_markdown, LiveMarkdown.Repo,
  username: "postgres",
  password: "postgres",
  database: "live_markdown_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
