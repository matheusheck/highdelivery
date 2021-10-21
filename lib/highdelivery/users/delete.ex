defmodule Highdelivery.Users.Delete do
  alias Ecto.UUID
  alias Highdelivery.{Error, Repo, User}

  def call(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_invalid}
      {:ok, uuid} -> delete(uuid)
    end
  end

  defp delete(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found()}
      user -> Repo.delete(user)
    end
  end
end
