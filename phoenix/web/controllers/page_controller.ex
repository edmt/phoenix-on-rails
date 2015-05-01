defmodule Phoenix.PageController do
  use Phoenix.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
