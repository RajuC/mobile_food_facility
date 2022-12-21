defmodule MobileFoodFacility.Facilities do
  @moduledoc """
  The Facilities context.
  """

  import Ecto.Query, warn: false
  alias MobileFoodFacility.Repo

  alias MobileFoodFacility.Facilities.Facility

  import Ecto.Query, only: [from: 2]

  @doc """
  Returns the list of facilities.

  ## Examples

      iex> list_facilities()
      [%Facility{}, ...]

  """
  def list_facilities do
    Repo.all(Facility)
  end

  @doc """
  Gets a single facility.

  Raises `Ecto.NoResultsError` if the Facility does not exist.

  ## Examples

      iex> get_facility!(123)
      %Facility{}

      iex> get_facility!(456)
      ** (Ecto.NoResultsError)

  """
  def get_facility!(id), do: Repo.get!(Facility, id)

  @doc """
  Creates a facility.

  ## Examples

      iex> create_facility(%{field: value})
      {:ok, %Facility{}}

      iex> create_facility(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_facility(attrs \\ %{}) do
    %Facility{}
    |> Facility.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a facility.

  ## Examples

      iex> update_facility(facility, %{field: new_value})
      {:ok, %Facility{}}

      iex> update_facility(facility, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_facility(%Facility{} = facility, attrs) do
    facility
    |> Facility.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a facility.

  ## Examples

      iex> delete_facility(facility)
      {:ok, %Facility{}}

      iex> delete_facility(facility)
      {:error, %Ecto.Changeset{}}

  """
  def delete_facility(%Facility{} = facility) do
    Repo.delete(facility)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking facility changes.

  ## Examples

      iex> change_facility(facility)
      %Ecto.Changeset{data: %Facility{}}

  """
  def change_facility(%Facility{} = facility, attrs \\ %{}) do
    Facility.changeset(facility, attrs)
  end


  def search_food(search_food_term) do
    food_term = "%#{search_food_term}%"
    query =
    from f in Facility,
    where: ilike(f.food_items, ^food_term)
    Repo.all(query)
  end

  def search_places(search_place_term) do
    place_term = "%#{search_place_term}%"
    query =
    from f in Facility,
    where: ilike(f.address, ^place_term),
    or_where: ilike(f.location_description, ^place_term)
    Repo.all(query)

  end

end
