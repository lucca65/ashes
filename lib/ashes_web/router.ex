defmodule AshesWeb.Router do
  use AshesWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  pipeline :admin do
    # TODO: Add authentication plug
    plug(:put_layout, {AshesWeb.LayoutView, :admin})
  end


  # App
  scope "/", AshesWeb do
    pipe_through(:browser)

    get("/", HomeController, :index)
  end

  # Protected admin routes
  scope "/admin", AshesWeb do
    pipe_through([:browser, :admin])

    get("/", Admin.HomeController, :index)
  end

end
