defmodule HighdeliveryWeb.UsersControllerTest do
  use HighdeliveryWeb.ConnCase, async: true

  import Highdelivery.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      params = build(:user_params)

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      assert %{"message" => "User created", "user" => %{"id" => _id, "name" => "Matheus"}} = response
    end

    test "when there is some error, returns the error", %{conn: conn} do
      params = %{
        "password" => "123456",
        "name" => "Matheus"
      }

      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      expected_response = %{
        "message" => %{
          "address" => ["can't be blank"],
          "age" => ["can't be blank"],
          "cep" => ["can't be blank"],
          "cpf" => ["can't be blank"],
          "email" => ["can't be blank"]
        }
      }

      assert response == expected_response
    end
  end

  # describe "delete/2" do
  #   test "when there is a user with the given id, deletes the user", %{conn: conn} do
  #     id = "1e175ab5-031a-4b36-9a0c-96da070501af"
  #     insert(:user)

  #     response =
  #       conn
  #       |> delete(Routes.users_path(conn, :delete, id))
  #       |> response(:no_content)

  #     assert response == ""
  #   end
  # end
end
