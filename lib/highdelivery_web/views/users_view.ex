defmodule HighdeliveryWeb.UsersView do
  use HighdeliveryWeb, :view

  alias Highdelivery.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created",
      user: %{
        id: user.id,
        name: user.name
      }
    }
  end
end
