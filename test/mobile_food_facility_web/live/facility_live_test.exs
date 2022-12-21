defmodule MobileFoodFacilityWeb.FacilityLiveTest do
  use MobileFoodFacilityWeb.ConnCase

  import Phoenix.LiveViewTest
  import MobileFoodFacility.FacilitiesFixtures

  @create_attrs %{address: "some address", applicant: "some applicant", approved_date: "some approved_date", block: "some block", block_lot: "some block_lot", cnn: "some cnn", days_hours: "some days_hours", expiration_date: "some expiration_date", fire_prevention_districts_count: "some fire_prevention_districts_count", food_items: "some food_items", latitude: 120.5, location: "some location", location_description: "some location_description", location_id: "some location_id", longitude: 120.5, lot: "some lot", noi_sent_date: "some noi_sent_date", old_neighborhoods_count: "some old_neighborhoods_count", permit: "some permit", police_districts_count: "some police_districts_count", prior_permit: "some prior_permit", received_day: "some received_day", schedule: "some schedule", status: "some status", supervisor_districts_count: "some supervisor_districts_count", type: "some type", x: 120.5, y: 120.5, zip_codes: "some zip_codes"}
  @update_attrs %{address: "some updated address", applicant: "some updated applicant", approved_date: "some updated approved_date", block: "some updated block", block_lot: "some updated block_lot", cnn: "some updated cnn", days_hours: "some updated days_hours", expiration_date: "some updated expiration_date", fire_prevention_districts_count: "some updated fire_prevention_districts_count", food_items: "some updated food_items", latitude: 456.7, location: "some updated location", location_description: "some updated location_description", location_id: "some updated location_id", longitude: 456.7, lot: "some updated lot", noi_sent_date: "some updated noi_sent_date", old_neighborhoods_count: "some updated old_neighborhoods_count", permit: "some updated permit", police_districts_count: "some updated police_districts_count", prior_permit: "some updated prior_permit", received_day: "some updated received_day", schedule: "some updated schedule", status: "some updated status", supervisor_districts_count: "some updated supervisor_districts_count", type: "some updated type", x: 456.7, y: 456.7, zip_codes: "some updated zip_codes"}
  @invalid_attrs %{address: nil, applicant: nil, approved_date: nil, block: nil, block_lot: nil, cnn: nil, days_hours: nil, expiration_date: nil, fire_prevention_districts_count: nil, food_items: nil, latitude: nil, location: nil, location_description: nil, location_id: nil, longitude: nil, lot: nil, noi_sent_date: nil, old_neighborhoods_count: nil, permit: nil, police_districts_count: nil, prior_permit: nil, received_day: nil, schedule: nil, status: nil, supervisor_districts_count: nil, type: nil, x: nil, y: nil, zip_codes: nil}

  defp create_facility(_) do
    facility = facility_fixture()
    %{facility: facility}
  end

  describe "Index" do
    setup [:create_facility]

    test "lists all facilities", %{conn: conn, facility: facility} do
      {:ok, _index_live, html} = live(conn, Routes.facility_index_path(conn, :index))

      assert html =~ "Listing Facilities"
      assert html =~ facility.address
    end

    test "saves new facility", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.facility_index_path(conn, :index))

      assert index_live |> element("a", "New Facility") |> render_click() =~
               "New Facility"

      assert_patch(index_live, Routes.facility_index_path(conn, :new))

      assert index_live
             |> form("#facility-form", facility: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#facility-form", facility: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.facility_index_path(conn, :index))

      assert html =~ "Facility created successfully"
      assert html =~ "some address"
    end

    test "updates facility in listing", %{conn: conn, facility: facility} do
      {:ok, index_live, _html} = live(conn, Routes.facility_index_path(conn, :index))

      assert index_live |> element("#facility-#{facility.id} a", "Edit") |> render_click() =~
               "Edit Facility"

      assert_patch(index_live, Routes.facility_index_path(conn, :edit, facility))

      assert index_live
             |> form("#facility-form", facility: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#facility-form", facility: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.facility_index_path(conn, :index))

      assert html =~ "Facility updated successfully"
      assert html =~ "some updated address"
    end

    test "deletes facility in listing", %{conn: conn, facility: facility} do
      {:ok, index_live, _html} = live(conn, Routes.facility_index_path(conn, :index))

      assert index_live |> element("#facility-#{facility.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#facility-#{facility.id}")
    end
  end

  describe "Show" do
    setup [:create_facility]

    test "displays facility", %{conn: conn, facility: facility} do
      {:ok, _show_live, html} = live(conn, Routes.facility_show_path(conn, :show, facility))

      assert html =~ "Show Facility"
      assert html =~ facility.address
    end

    test "updates facility within modal", %{conn: conn, facility: facility} do
      {:ok, show_live, _html} = live(conn, Routes.facility_show_path(conn, :show, facility))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Facility"

      assert_patch(show_live, Routes.facility_show_path(conn, :edit, facility))

      assert show_live
             |> form("#facility-form", facility: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#facility-form", facility: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.facility_show_path(conn, :show, facility))

      assert html =~ "Facility updated successfully"
      assert html =~ "some updated address"
    end
  end
end
