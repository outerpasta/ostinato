defmodule Ostinato.PageController do
  use Ostinato.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
