defmodule Highdelivery.Users.Create do
  alias Highdelivery.{Repo, User}

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
