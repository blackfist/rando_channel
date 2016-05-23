defmodule Broadcaster.PageController do
  use Broadcaster.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
