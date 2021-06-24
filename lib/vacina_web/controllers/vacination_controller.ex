defmodule VacinaWeb.VacinationController do
  use VacinaWeb, :controller

  alias Vacina.Vacines
  alias Vacina.Vacines.Vacination

  def index(conn, _params) do
    vacinations = Vacines.list_vacinations()
    render(conn, "index.html", vacinations: vacinations)
  end

  def new(conn, _params) do
    changeset = Vacines.change_vacination(%Vacination{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"vacination" => vacination_params}) do
    case Vacines.create_vacination(vacination_params) do
      {:ok, vacination} ->
        conn
        |> put_flash(:info, "Vacination created successfully.")
        |> redirect(to: Routes.vacination_path(conn, :show, vacination))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vacination = Vacines.get_vacination!(id)
    render(conn, "show.html", vacination: vacination)
  end

  def edit(conn, %{"id" => id}) do
    vacination = Vacines.get_vacination!(id)
    changeset = Vacines.change_vacination(vacination)
    render(conn, "edit.html", vacination: vacination, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vacination" => vacination_params}) do
    vacination = Vacines.get_vacination!(id)

    case Vacines.update_vacination(vacination, vacination_params) do
      {:ok, vacination} ->
        conn
        |> put_flash(:info, "Vacination updated successfully.")
        |> redirect(to: Routes.vacination_path(conn, :show, vacination))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", vacination: vacination, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vacination = Vacines.get_vacination!(id)
    {:ok, _vacination} = Vacines.delete_vacination(vacination)

    conn
    |> put_flash(:info, "Vacination deleted successfully.")
    |> redirect(to: Routes.vacination_path(conn, :index))
  end
end
