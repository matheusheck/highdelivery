defmodule Highdelivery.Users.Create do
  alias Highdelivery.{Error, Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
    |> handle_create()
  end


  defp handle_create({:ok, %User{}} = result), do: result
  defp handle_create({:error, result}) do
   {:error, Error.build(:bad_request, result)}
  end
end
