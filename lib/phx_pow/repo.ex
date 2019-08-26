defmodule PhxPow.Repo do
  use Ecto.Repo,
    otp_app: :phx_pow,
    adapter: Ecto.Adapters.Postgres
end
