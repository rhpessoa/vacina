defmodule Vacina.Repo do
  use Ecto.Repo,
    otp_app: :vacina,
    adapter: Ecto.Adapters.Postgres
end
