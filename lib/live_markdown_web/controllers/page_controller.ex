defmodule LiveMarkdownWeb.PageController do
  use LiveMarkdownWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
