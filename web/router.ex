defmodule CoherenceDemo.Router do
  use CoherenceDemo.Web, :router
  use Coherence.Router         # Add this

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session  # Add this
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true  # Add this
  end

  # Add this block
  scope "/", CoherenceDemo do
    pipe_through :browser
    coherence_routes
  end

  # Add this block
  scope "/", CoherenceDemo do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", CoherenceDemo do
    pipe_through :browser
    get "/", PageController, :index
    # Add public routes below
  end

  scope "/", CoherenceDemo do
    pipe_through :protected
    # Add protected routes below
  end
end

