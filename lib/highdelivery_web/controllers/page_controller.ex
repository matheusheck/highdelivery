defmodule HighdeliveryWeb.PageController do
  use HighdeliveryWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
