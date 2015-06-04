defmodule PhoenixIcip.HelloController do
  use PhoenixIcip.Web, :controller

  plug :action
  plug :render

  def index conn, _params do
    conn
    |> assign(:message, "Welcome back!")
    |> assign(:name, "Riza")
    # |> put_flash(:info, "Welcome to Phoenix, from flash")
    # |> put_flash(:error, "Let's pretend we have error")
    # |> render "index.html"
  end

  def show conn, %{"messenger" => messenger} do
    render conn, "show.html", messenger: messenger
  end
end
