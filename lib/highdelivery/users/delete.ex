defmodule Highdelivery.Users.Delete do
  alias Ecto.UUID
  alias Highdelivery.{Repo, User}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, %{status: :bad_requeest, result: "Invalid ID format"}}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, %{status: :not_found, result: "User not found"}}
      user -> Repo.delete(user)
    end
  end
end