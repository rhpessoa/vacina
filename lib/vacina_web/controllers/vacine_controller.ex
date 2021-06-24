defmodule VacinaWeb.VacineController do
  use VacinaWeb, :controller

  alias Vacina.Vacination
  alias Vacina.Vacination.Vacine

  def index(conn, _params) do
    vacines = Vacination.list_vacines()
    render(conn, "index.html", vacines: vacines)
  end

  def new(conn, _params) do
    changeset = Vacination.change_vacine(%Vacine{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vacine" => vacine_params}) do
    case Vacination.create_vacine(vacine_params) do
      {:ok, vacine} ->
        conn
        |> put_flash(:info, "Vacine created successfully.")
        |> redirect(to: Routes.vacine_path(conn, :show, vacine))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vacine = Vacination.get_vacine!(id)
    render(conn, "show.html", vacine: vacine)
  end

  def edit(conn, %{"id" => id}) do
    vacine = Vacination.get_vacine!(id)
    changeset = Vacination.change_vacine(vacine)
    render(conn, "edit.html", vacine: vacine, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vacine" => vacine_params}) do
    vacine = Vacination.get_vacine!(id)

    case Vacination.update_vacine(vacine, vacine_params) do
      {:ok, vacine} ->
        conn
        |> put_flash(:info, "Vacine updated successfully.")
        |> redirect(to: Routes.vacine_path(conn, :show, vacine))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", vacine: vacine, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vacine = Vacination.get_vacine!(id)
    {:ok, _vacine} = Vacination.delete_vacine(vacine)

    conn
    |> put_flash(:info, "Vacine deleted successfully.")
    |> redirect(to: Routes.vacine_path(conn, :index))
  end
end
