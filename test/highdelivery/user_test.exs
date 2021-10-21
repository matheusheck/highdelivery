defmodule Highdelivery.UserTest do
  use Highdelivery.DataCase, async: true

  import Highdelivery.Factory

  alias Ecto.Changeset
  alias Highdelivery.User


  describe "changeset/2" do
    test "when all params are valid, returns a valid changeset" do
      params = build(:user_params)

      response = User.changeset (params)

      assert %Changeset{changes: %{name: "Matheus"}, valid?: true} = response
    end

    test "when updating a value, returns a valid changeset" do
      params = build(:user_params)

      update_params = %{name: "Matheus Heck"}

      response =
        params
        |> User.changeset()
        |> User.changeset(update_params)

      assert %Changeset{changes: %{name: "Matheus Heck"}, valid?: true} = response
    end

    test "if any param is valid, returns a invalid changeset" do
      params = %{
        age: 17,
        address: "Rua das bananeiras, 15",
        cep: "1234567",
        cpf: "1234567891",
        email: "banana.com",
        password: "123",
        name: "Matheus"
      }

      response = User.changeset (params)

      expected_response = %{
        age: ["must be greater than or equal to 18"],
        cep: ["should be at least 8 character(s)"],
        cpf: ["should be at least 11 character(s)"],
        email: ["has invalid format"],
        password: ["should be at least 6 character(s)"]
      }

      assert errors_on(response) == expected_response
    end
  end
end
