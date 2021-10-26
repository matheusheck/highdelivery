defmodule Highdelivery.Factory do
  use ExMachina

  alias Highdelivery.User

  def user_params_factory do
    %{
      age: 27,
      address: "Rua das bananeiras, 15",
      cep: "12345678",
      cpf: "12345678901",
      email: "Matheus@banana.com",
      password: "123456",
      name: "Matheus"
    }
  end

  def user_factory do
    %User{
      age: 27,
      address: "Rua das bananeiras, 15",
      cep: "12345678",
      cpf: "12345678901",
      email: "Matheus@banana.com",
      password: "123456",
      name: "Matheus",
      id: "1e175ab5-031a-4b36-9a0c-96da070501af"
    }
  end
end
