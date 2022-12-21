defmodule MobileFoodFacility.Facilities.Facility do
  use Ecto.Schema
  import Ecto.Changeset

  schema "facilities" do
    field :address, :string
    field :applicant, :string
    field :approved_date, :string
    field :block, :string
    field :block_lot, :string
    field :cnn, :string
    field :days_hours, :string
    field :expiration_date, :string
    field :fire_prevention_districts_count, :string
    field :food_items, :string
    field :latitude, :float
    field :location, :string
    field :location_description, :string
    field :location_id, :string
    field :longitude, :float
    field :lot, :string
    field :noi_sent_date, :string
    field :old_neighborhoods_count, :string
    field :permit, :string
    field :police_districts_count, :string
    field :prior_permit, :string
    field :received_day, :string
    field :schedule, :string
    field :status, :string
    field :supervisor_districts_count, :string
    field :type, :string
    field :x, :float
    field :y, :float
    field :zip_codes, :string

    # timestamps()
  end

  @doc false
  def changeset(facility, attrs) do
    facility
    |> cast(attrs, [:location_id, :applicant, :type, :cnn, :location_description, :address, :block_lot, :block, :lot, :permit, :status, :food_items, :x, :y, :latitude, :longitude, :schedule, :days_hours, :noi_sent_date, :approved_date, :received_day, :prior_permit, :expiration_date, :location, :fire_prevention_districts_count, :police_districts_count, :supervisor_districts_count, :zip_codes, :old_neighborhoods_count])
    |> validate_required([:location_id, :applicant, :type, :cnn, :location_description, :address, :block_lot, :block, :lot, :permit, :status, :food_items, :x, :y, :latitude, :longitude, :schedule, :days_hours, :noi_sent_date, :approved_date, :received_day, :prior_permit, :expiration_date, :location, :fire_prevention_districts_count, :police_districts_count, :supervisor_districts_count, :zip_codes, :old_neighborhoods_count])
  end
end
