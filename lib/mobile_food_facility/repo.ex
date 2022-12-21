defmodule MobileFoodFacility.Repo do
  use Ecto.Repo,
    otp_app: :mobile_food_facility,
    adapter: Ecto.Adapters.Postgres
end
