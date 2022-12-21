defmodule MobileFoodFacility.FacilitiesTest do
  use MobileFoodFacility.DataCase

  alias MobileFoodFacility.Facilities

  describe "facilities" do
    alias MobileFoodFacility.Facilities.Facility

    import MobileFoodFacility.FacilitiesFixtures

    @invalid_attrs %{address: nil, applicant: nil, approved_date: nil, block: nil, block_lot: nil, cnn: nil, days_hours: nil, expiration_date: nil, fire_prevention_districts_count: nil, food_items: nil, latitude: nil, location: nil, location_description: nil, location_id: nil, longitude: nil, lot: nil, noi_sent_date: nil, old_neighborhoods_count: nil, permit: nil, police_districts_count: nil, prior_permit: nil, received_day: nil, schedule: nil, status: nil, supervisor_districts_count: nil, type: nil, x: nil, y: nil, zip_codes: nil}

    test "list_facilities/0 returns all facilities" do
      facility = facility_fixture()
      assert Facilities.list_facilities() == [facility]
    end

    test "get_facility!/1 returns the facility with given id" do
      facility = facility_fixture()
      assert Facilities.get_facility!(facility.id) == facility
    end

    test "create_facility/1 with valid data creates a facility" do
      valid_attrs = %{address: "some address", applicant: "some applicant", approved_date: "some approved_date", block: "some block", block_lot: "some block_lot", cnn: "some cnn", days_hours: "some days_hours", expiration_date: "some expiration_date", fire_prevention_districts_count: "some fire_prevention_districts_count", food_items: "some food_items", latitude: 120.5, location: "some location", location_description: "some location_description", location_id: "some location_id", longitude: 120.5, lot: "some lot", noi_sent_date: "some noi_sent_date", old_neighborhoods_count: "some old_neighborhoods_count", permit: "some permit", police_districts_count: "some police_districts_count", prior_permit: "some prior_permit", received_day: "some received_day", schedule: "some schedule", status: "some status", supervisor_districts_count: "some supervisor_districts_count", type: "some type", x: 120.5, y: 120.5, zip_codes: "some zip_codes"}

      assert {:ok, %Facility{} = facility} = Facilities.create_facility(valid_attrs)
      assert facility.address == "some address"
      assert facility.applicant == "some applicant"
      assert facility.approved_date == "some approved_date"
      assert facility.block == "some block"
      assert facility.block_lot == "some block_lot"
      assert facility.cnn == "some cnn"
      assert facility.days_hours == "some days_hours"
      assert facility.expiration_date == "some expiration_date"
      assert facility.fire_prevention_districts_count == "some fire_prevention_districts_count"
      assert facility.food_items == "some food_items"
      assert facility.latitude == 120.5
      assert facility.location == "some location"
      assert facility.location_description == "some location_description"
      assert facility.location_id == "some location_id"
      assert facility.longitude == 120.5
      assert facility.lot == "some lot"
      assert facility.noi_sent_date == "some noi_sent_date"
      assert facility.old_neighborhoods_count == "some old_neighborhoods_count"
      assert facility.permit == "some permit"
      assert facility.police_districts_count == "some police_districts_count"
      assert facility.prior_permit == "some prior_permit"
      assert facility.received_day == "some received_day"
      assert facility.schedule == "some schedule"
      assert facility.status == "some status"
      assert facility.supervisor_districts_count == "some supervisor_districts_count"
      assert facility.type == "some type"
      assert facility.x == 120.5
      assert facility.y == 120.5
      assert facility.zip_codes == "some zip_codes"
    end

    test "create_facility/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Facilities.create_facility(@invalid_attrs)
    end

    test "update_facility/2 with valid data updates the facility" do
      facility = facility_fixture()
      update_attrs = %{address: "some updated address", applicant: "some updated applicant", approved_date: "some updated approved_date", block: "some updated block", block_lot: "some updated block_lot", cnn: "some updated cnn", days_hours: "some updated days_hours", expiration_date: "some updated expiration_date", fire_prevention_districts_count: "some updated fire_prevention_districts_count", food_items: "some updated food_items", latitude: 456.7, location: "some updated location", location_description: "some updated location_description", location_id: "some updated location_id", longitude: 456.7, lot: "some updated lot", noi_sent_date: "some updated noi_sent_date", old_neighborhoods_count: "some updated old_neighborhoods_count", permit: "some updated permit", police_districts_count: "some updated police_districts_count", prior_permit: "some updated prior_permit", received_day: "some updated received_day", schedule: "some updated schedule", status: "some updated status", supervisor_districts_count: "some updated supervisor_districts_count", type: "some updated type", x: 456.7, y: 456.7, zip_codes: "some updated zip_codes"}

      assert {:ok, %Facility{} = facility} = Facilities.update_facility(facility, update_attrs)
      assert facility.address == "some updated address"
      assert facility.applicant == "some updated applicant"
      assert facility.approved_date == "some updated approved_date"
      assert facility.block == "some updated block"
      assert facility.block_lot == "some updated block_lot"
      assert facility.cnn == "some updated cnn"
      assert facility.days_hours == "some updated days_hours"
      assert facility.expiration_date == "some updated expiration_date"
      assert facility.fire_prevention_districts_count == "some updated fire_prevention_districts_count"
      assert facility.food_items == "some updated food_items"
      assert facility.latitude == 456.7
      assert facility.location == "some updated location"
      assert facility.location_description == "some updated location_description"
      assert facility.location_id == "some updated location_id"
      assert facility.longitude == 456.7
      assert facility.lot == "some updated lot"
      assert facility.noi_sent_date == "some updated noi_sent_date"
      assert facility.old_neighborhoods_count == "some updated old_neighborhoods_count"
      assert facility.permit == "some updated permit"
      assert facility.police_districts_count == "some updated police_districts_count"
      assert facility.prior_permit == "some updated prior_permit"
      assert facility.received_day == "some updated received_day"
      assert facility.schedule == "some updated schedule"
      assert facility.status == "some updated status"
      assert facility.supervisor_districts_count == "some updated supervisor_districts_count"
      assert facility.type == "some updated type"
      assert facility.x == 456.7
      assert facility.y == 456.7
      assert facility.zip_codes == "some updated zip_codes"
    end

    test "update_facility/2 with invalid data returns error changeset" do
      facility = facility_fixture()
      assert {:error, %Ecto.Changeset{}} = Facilities.update_facility(facility, @invalid_attrs)
      assert facility == Facilities.get_facility!(facility.id)
    end

    test "delete_facility/1 deletes the facility" do
      facility = facility_fixture()
      assert {:ok, %Facility{}} = Facilities.delete_facility(facility)
      assert_raise Ecto.NoResultsError, fn -> Facilities.get_facility!(facility.id) end
    end

    test "change_facility/1 returns a facility changeset" do
      facility = facility_fixture()
      assert %Ecto.Changeset{} = Facilities.change_facility(facility)
    end
  end
end
