defmodule HighdeliveryWeb.UsersViewTest do
  use HighdeliveryWeb.ConnCase, async: true

  import Phoenix.View
  import Highdelivery.Factory

  alias HighdeliveryWeb.UsersView

  test "renders create.json" do
    user = build(:user)

    response = render(UsersView, "create.json", user: user)

    assert %{
      message: "User created",
      user:
      %{
        id: "1e175ab5-031a-4b36-9a0c-96da070501af",
        name: "Matheus"
      }} = response
  end
end
