defmodule Highdelivery.Repo do
  use Ecto.Repo,
    otp_app: :highdelivery,
    adapter: Ecto.Adapters.Postgres
end
