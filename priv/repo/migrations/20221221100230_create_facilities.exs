defmodule MobileFoodFacility.Repo.Migrations.CreateFacilities do
  use Ecto.Migration

  def change do
    create table(:facilities) do
      add :location_id, :string
      add :applicant, :string
      add :type, :string
      add :cnn, :string
      add :location_description, :text
      add :address, :text
      add :block_lot, :string
      add :block, :string
      add :lot, :string
      add :permit, :string
      add :status, :string
      add :food_items, :text
      add :x, :float
      add :y, :float
      add :latitude, :float
      add :longitude, :float
      add :schedule, :text
      add :days_hours, :text
      add :noi_sent_date, :string
      add :approved_date, :string
      add :received_day, :string
      add :prior_permit, :string
      add :expiration_date, :string
      add :location, :string
      add :fire_prevention_districts_count, :string
      add :police_districts_count, :string
      add :supervisor_districts_count, :string
      add :zip_codes, :string
      add :old_neighborhoods_count, :string

      # timestamps()
    end
  end
end
