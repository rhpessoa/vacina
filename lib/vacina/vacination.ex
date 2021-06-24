defmodule Vacina.Vacination do
  @moduledoc """
  The Vacination context.
  """

  import Ecto.Query, warn: false
  alias Vacina.Repo

  alias Vacina.Vacination.Vacine

  @doc """
  Returns the list of vacines.

  ## Examples

      iex> list_vacines()
      [%Vacine{}, ...]

  """
  def list_vacines do
    Repo.all(Vacine)
  end

  @doc """
  Gets a single vacine.

  Raises `Ecto.NoResultsError` if the Vacine does not exist.

  ## Examples

      iex> get_vacine!(123)
      %Vacine{}

      iex> get_vacine!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vacine!(id), do: Repo.get!(Vacine, id)

  @doc """
  Creates a vacine.

  ## Examples

      iex> create_vacine(%{field: value})
      {:ok, %Vacine{}}

      iex> create_vacine(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vacine(attrs \\ %{}) do
    %Vacine{}
    |> Vacine.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vacine.

  ## Examples

      iex> update_vacine(vacine, %{field: new_value})
      {:ok, %Vacine{}}

      iex> update_vacine(vacine, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vacine(%Vacine{} = vacine, attrs) do
    vacine
    |> Vacine.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vacine.

  ## Examples

      iex> delete_vacine(vacine)
      {:ok, %Vacine{}}

      iex> delete_vacine(vacine)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vacine(%Vacine{} = vacine) do
    Repo.delete(vacine)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vacine changes.

  ## Examples

      iex> change_vacine(vacine)
      %Ecto.Changeset{data: %Vacine{}}

  """
  def change_vacine(%Vacine{} = vacine, attrs \\ %{}) do
    Vacine.changeset(vacine, attrs)
  end
end
