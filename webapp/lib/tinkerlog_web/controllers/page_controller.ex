defmodule TinkerlogWeb.PageController do
  use TinkerlogWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
