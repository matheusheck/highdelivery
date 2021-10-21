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

  def delete(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Highdelivery.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Highdelivery.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

end
