defmodule MobileFoodFacility.FacilitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MobileFoodFacility.Facilities` context.
  """

  @doc """
  Generate a facility.
  """
  def facility_fixture(attrs \\ %{}) do
    {:ok, facility} =
      attrs
      |> Enum.into(%{
        address: "some address",
        applicant: "some applicant",
        approved_date: "some approved_date",
        block: "some block",
        block_lot: "some block_lot",
        cnn: "some cnn",
        days_hours: "some days_hours",
        expiration_date: "some expiration_date",
        fire_prevention_districts_count: "some fire_prevention_districts_count",
        food_items: "some food_items",
        latitude: 120.5,
        location: "some location",
        location_description: "some location_description",
        location_id: "some location_id",
        longitude: 120.5,
        lot: "some lot",
        noi_sent_date: "some noi_sent_date",
        old_neighborhoods_count: "some old_neighborhoods_count",
        permit: "some permit",
        police_districts_count: "some police_districts_count",
        prior_permit: "some prior_permit",
        received_day: "some received_day",
        schedule: "some schedule",
        status: "some status",
        supervisor_districts_count: "some supervisor_districts_count",
        type: "some type",
        x: 120.5,
        y: 120.5,
        zip_codes: "some zip_codes"
      })
      |> MobileFoodFacility.Facilities.create_facility()

    facility
  end
end
