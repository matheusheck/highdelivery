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

  def render("user.json", %{user: %User{} = user}) do
    %{user:
     %{
        id: user.id,
        name: user.name,
        address: user.address,
        email: user.email,
        cpf: user.cpf
      }}
  end
end
