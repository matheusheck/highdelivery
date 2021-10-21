defmodule Highdelivery.Users.Delete do
  alias Highdelivery.{Error, Repo, User}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_user_not_found()}
      user -> Repo.delete(user)
    end
  end
end
