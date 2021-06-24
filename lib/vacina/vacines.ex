defmodule Vacina.Vacines do
  @moduledoc """
  The Vacines context.
  """

  import Ecto.Query, warn: false
  alias Vacina.Repo

  alias Vacina.Vacines.Person

  @doc """
  Returns the list of persons.

  ## Examples

      iex> list_persons()
      [%Person{}, ...]

  """
  def list_persons do
    Repo.all(Person)
  end

  @doc """
  Gets a single person.

  Raises `Ecto.NoResultsError` if the Person does not exist.

  ## Examples

      iex> get_person!(123)
      %Person{}

      iex> get_person!(456)
      ** (Ecto.NoResultsError)

  """
  def get_person!(id), do: Repo.get!(Person, id)

  @doc """
  Creates a person.

  ## Examples

      iex> create_person(%{field: value})
      {:ok, %Person{}}

      iex> create_person(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_person(attrs \\ %{}) do
    %Person{}
    |> Person.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a person.

  ## Examples

      iex> update_person(person, %{field: new_value})
      {:ok, %Person{}}

      iex> update_person(person, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_person(%Person{} = person, attrs) do
    person
    |> Person.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a person.

  ## Examples

      iex> delete_person(person)
      {:ok, %Person{}}

      iex> delete_person(person)
      {:error, %Ecto.Changeset{}}

  """
  def delete_person(%Person{} = person) do
    Repo.delete(person)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking person changes.

  ## Examples

      iex> change_person(person)
      %Ecto.Changeset{data: %Person{}}

  """
  def change_person(%Person{} = person, attrs \\ %{}) do
    Person.changeset(person, attrs)
  end

  def get_person_by_cpf(cpf) do
    case Repo.get_by(Person, cpf: cpf) do
      nil -> {:error, :person_not_found}
      person -> {:ok, person}
    end
  end

  alias Vacina.Vacines.Vacination

  @doc """
  Returns the list of vacinations.

  ## Examples

      iex> list_vacinations()
      [%Vacination{}, ...]

  """
  def list_vacinations do
    Repo.all(Vacination)
  end

  @doc """
  Gets a single vacination.

  Raises `Ecto.NoResultsError` if the Vacination does not exist.

  ## Examples

      iex> get_vacination!(123)
      %Vacination{}

      iex> get_vacination!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vacination!(id), do: Repo.get!(Vacination, id)

  @doc """
  Creates a vacination.

  ## Examples

      iex> create_vacination(%{field: value})
      {:ok, %Vacination{}}

      iex> create_vacination(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vacination(attrs \\ %{}) do
    with {:ok, %{id: vacinado}} <- get_person_by_cpf(attrs["cpf"]) do
      attrs = Map.put(attrs, "vacinado", vacinado)

      %Vacination{}
      |> Vacination.changeset(attrs)
      |> Repo.insert()
    end
  end

  @doc """
  Updates a vacination.

  ## Examples

      iex> update_vacination(vacination, %{field: new_value})
      {:ok, %Vacination{}}

      iex> update_vacination(vacination, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vacination(%Vacination{} = vacination, attrs) do
    vacination
    |> Vacination.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vacination.

  ## Examples

      iex> delete_vacination(vacination)
      {:ok, %Vacination{}}

      iex> delete_vacination(vacination)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vacination(%Vacination{} = vacination) do
    Repo.delete(vacination)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vacination changes.

  ## Examples

      iex> change_vacination(vacination)
      %Ecto.Changeset{data: %Vacination{}}

  """
  def change_vacination(%Vacination{} = vacination, attrs \\ %{}) do
    Vacination.changeset(vacination, attrs)
  end
end
