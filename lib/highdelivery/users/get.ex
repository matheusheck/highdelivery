defmodule Highdelivery.Users.Get do
  alias Ecto.UUID
  alias Highdelivery.{Error, Repo, User}

  def by_id(id) do
    case UUID.cast(id) do
      :error -> {:error, Error.build_id_format_invalid()}
      {:ok, uuid} -> get(uuid)
    end
  end

  defp get(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found()}
      user -> {:ok, user}
    end
  end
end
