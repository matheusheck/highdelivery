defmodule Highdelivery.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @requered_params [:age, :address, :cep, :cpf, :email, :password_hash, :name]

  schema "users" do
    field :age, :integer
    field :address, :string
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :password_hash, :string
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @requered_params)
  end
end
