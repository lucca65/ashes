defmodule Ashes.Web.HomeController do
  use Ashes.Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
