defmodule MobileFoodFacilityWeb.FacilityLive.FormComponent do
  use MobileFoodFacilityWeb, :live_component

  alias MobileFoodFacility.Facilities

  @impl true
  def update(%{facility: facility} = assigns, socket) do
    changeset = Facilities.change_facility(facility)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"facility" => facility_params}, socket) do
    changeset =
      socket.assigns.facility
      |> Facilities.change_facility(facility_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"facility" => facility_params}, socket) do
    save_facility(socket, socket.assigns.action, facility_params)
  end

  defp save_facility(socket, :edit, facility_params) do
    case Facilities.update_facility(socket.assigns.facility, facility_params) do
      {:ok, _facility} ->
        {:noreply,
         socket
         |> put_flash(:info, "Facility updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_facility(socket, :new, facility_params) do
    case Facilities.create_facility(facility_params) do
      {:ok, _facility} ->
        {:noreply,
         socket
         |> put_flash(:info, "Facility created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
