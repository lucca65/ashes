defmodule AshesWeb.Admin.HomeController do
  use AshesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
