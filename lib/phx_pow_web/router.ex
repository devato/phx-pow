defmodule PhxPowWeb.Router do
  use PhxPowWeb, :router
  use Pow.Phoenix.Router
  use Pow.Extension.Phoenix.Router, otp_app: :phx_pow

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
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end

  scope "/" do
    pipe_through :browser

    pow_routes()
    pow_extension_routes()
  end

  scope "/", PhxPowWeb do
    pipe_through [:browser, :protected]

    # Add your protected routes here
  end

  scope "/", PhxPowWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  scope "/api", PhxPowWeb do
    pipe_through :api
  end
end
