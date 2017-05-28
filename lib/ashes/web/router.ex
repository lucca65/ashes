defmodule Ashes.Web.Router do
  use Ashes.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
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
    plug Coherence.Authentication.Session, protected: true
    plug :put_layout, {Coherence.LayoutView, :app}
  end

  # Keep this empty
  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/admin" do
    pipe_through :protected
    coherence_routes :protected
  end

  # Public Routes
  scope "/", Ashes.Web do
    pipe_through :browser # Use the default browser stack
    get "/", PageController, :index
  end

  # Protected Routes
  scope "/", Ashes.Web do
    pipe_through :protected
    get "/admin", Base.AdminHomeController, :index
  end
end
