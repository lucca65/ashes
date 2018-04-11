defmodule Ashes.Web.Router do
  use Ashes.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :admin_layout do
    plug(:put_layout, {Ashes.LayoutView, :admin})
  end

  # Keep this empty
  scope "/" do
    pipe_through :browser
  end

  # Public Routes
  scope "/", Ashes.Web do
    pipe_through :browser # Use the default browser stack

    get("/", HomeController, :index)
  end

  # Protected Routes
  scope "/admin", Ashes.Web do
    pipe_through([:browser, :protected, :admin_layout])

    get "/", Admin.HomeController, :index
  end
end
