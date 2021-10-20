defmodule HighdeliveryWeb.UsersController do
  use HighdeliveryWeb, :controller

  alias Highdelivery.User
  alias HighdeliveryWeb.FallbackController

  action_fallback (FallbackController)

  def create(conn, params) do
    with {:ok, %User{} = user} <- Highdelivery.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
