defmodule Highdelivery.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @requered_params [:age, :address, :cep, :cpf, :email, :password, :name]
  @requered_update_params [:age, :address, :cep, :cpf, :email, :name]

  schema "users" do
    field :age, :integer
    field :address, :string
    field :cep, :string
    field :cpf, :string
    field :email, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :name, :string

    timestamps()
  end

  # For creation
  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @requered_params)
    |> validate_required(@requered_params)
    |> validate_length(:password, min: 6)
    |> validate_full_info()
    |> put_password_hash()
  end

  # For update
  def changeset(struct, params) do
    struct
    |> cast(params, @requered_update_params)
    |> validate_required(@requered_update_params)
    |> validate_full_info()
  end

  defp validate_full_info(changeset) do
    changeset
    |> validate_length(:cep, min: 8)
    |> validate_length(:cpf, min: 11)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
  end

  defp put_password_hash(%Changeset{valid?: true, changes: %{password: password}} = changeset) do
    change(changeset, Pbkdf2.add_hash(password))
  end
  defp put_password_hash(changeset), do: changeset
end
