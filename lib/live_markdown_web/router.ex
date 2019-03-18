defmodule LiveMarkdownWeb.Router do
  use LiveMarkdownWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :put_layout, {LiveMarkdownWeb.LayoutView, :app}
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LiveMarkdownWeb do
    pipe_through :browser

    live("/", MarkdownLive)
  end

  # Other scopes may use custom stacks.
  # scope "/api", LiveMarkdownWeb do
  #   pipe_through :api
  # end
end
