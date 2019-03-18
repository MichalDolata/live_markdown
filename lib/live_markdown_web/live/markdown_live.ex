defmodule LiveMarkdownWeb.MarkdownLive do
  use Phoenix.LiveView

  alias LiveMarkdownWeb.MarkdownView

  def render(assigns), do: MarkdownView.render("index.html", assigns)

  def mount(_session, socket) do
    {:ok, assign(socket, :html, "")}
  end

  def handle_event("update-source", %{"markdown" => markdown}, socket) do
    html = Earmark.as_html!(markdown)
    {:noreply, assign(socket, :html, html)}
  end
end
