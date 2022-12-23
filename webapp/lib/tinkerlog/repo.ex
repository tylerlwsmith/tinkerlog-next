defmodule Tinkerlog.Repo do
  use Ecto.Repo,
    otp_app: :tinkerlog,
    adapter: Ecto.Adapters.Postgres
end
