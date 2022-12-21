defmodule MobileFoodFacilityWeb.FacilityLive.Index do
  use MobileFoodFacilityWeb, :live_view

  alias MobileFoodFacility.Facilities
  alias MobileFoodFacility.Facilities.Facility

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :facilities, list_facilities())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Facility")
    |> assign(:facility, Facilities.get_facility!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Facility")
    |> assign(:facility, %Facility{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Facilities")
    |> assign(:facility, nil)
  end


  
  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    facility = Facilities.get_facility!(id)
    {:ok, _} = Facilities.delete_facility(facility)

    {:noreply, assign(socket, :facilities, list_facilities())}
  end

  defp list_facilities do
    Facilities.list_facilities()
  end
end
