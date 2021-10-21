defmodule Highdelivery do
  alias Highdelivery.Users.Create, as: UserCreate
  alias Highdelivery.Users.Delete, as: UserDelete
  alias Highdelivery.Users.Get, as: UserGet

  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate delete_user(id), to: UserDelete, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
end
