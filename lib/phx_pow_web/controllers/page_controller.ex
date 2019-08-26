defmodule PhxPowWeb.PageController do
  use PhxPowWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
