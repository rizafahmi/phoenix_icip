defmodule PhoenixIcip.HelloController do
  use PhoenixIcip.Web, :controller

  plug :action

  def index conn, _params do
    redirect conn, to: redirect_test_path(conn, :redirect_test)
    # redirect conn, external: "http://elixir-lang.org/"
  end

  def redirect_test conn, _params do
    text conn, "Redirect!"
  end

  def show conn, %{"messenger" => messenger} do
    render conn, "show.html", messenger: messenger
  end

  def listing conn, _params do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(201, "")
  end
end
