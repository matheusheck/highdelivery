defmodule Highdelivery.Factory do
  use ExMachina

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
end
