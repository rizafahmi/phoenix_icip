defmodule PhoenixIcip.Router do
  use PhoenixIcip.Web, :router

  pipeline :browser do
    plug :accepts, ["html", "text"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PhoenixIcip do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/hello", HelloController, :index
    get "/redirect_test", HelloController, :redirect_test, as: :redirect_test
    get "/list", HelloController, :listing
    get "/hello/:messenger", HelloController, :show
    resources "users", UserController do
      resources "posts", PostController
    end
    resources "posts", PostController, only: [:index, :show]
    resources "comments", CommentController, except: [:delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PhoenixIcip do
  #   pipe_through :api
  # end
end
