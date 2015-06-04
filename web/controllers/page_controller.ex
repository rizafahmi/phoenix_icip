defmodule PhoenixIcip.PageController do
  use PhoenixIcip.Web, :controller

  plug :action

  def index(conn, _params) do
    render conn, "index.html"
  end
end
