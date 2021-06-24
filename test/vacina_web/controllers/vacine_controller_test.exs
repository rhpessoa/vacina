defmodule VacinaWeb.VacineControllerTest do
  use VacinaWeb.ConnCase

  alias Vacina.Vacination

  @create_attrs %{descricao: "some descricao", fabricante: "some fabricante", nome: "some nome"}
  @update_attrs %{descricao: "some updated descricao", fabricante: "some updated fabricante", nome: "some updated nome"}
  @invalid_attrs %{descricao: nil, fabricante: nil, nome: nil}

  def fixture(:vacine) do
    {:ok, vacine} = Vacination.create_vacine(@create_attrs)
    vacine
  end

  describe "index" do
    test "lists all vacines", %{conn: conn} do
      conn = get(conn, Routes.vacine_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Vacines"
    end
  end

  describe "new vacine" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.vacine_path(conn, :new))
      assert html_response(conn, 200) =~ "New Vacine"
    end
  end

  describe "create vacine" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vacine_path(conn, :create), vacine: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.vacine_path(conn, :show, id)

      conn = get(conn, Routes.vacine_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Vacine"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vacine_path(conn, :create), vacine: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Vacine"
    end
  end

  describe "edit vacine" do
    setup [:create_vacine]

    test "renders form for editing chosen vacine", %{conn: conn, vacine: vacine} do
      conn = get(conn, Routes.vacine_path(conn, :edit, vacine))
      assert html_response(conn, 200) =~ "Edit Vacine"
    end
  end

  describe "update vacine" do
    setup [:create_vacine]

    test "redirects when data is valid", %{conn: conn, vacine: vacine} do
      conn = put(conn, Routes.vacine_path(conn, :update, vacine), vacine: @update_attrs)
      assert redirected_to(conn) == Routes.vacine_path(conn, :show, vacine)

      conn = get(conn, Routes.vacine_path(conn, :show, vacine))
      assert html_response(conn, 200) =~ "some updated descricao"
    end

    test "renders errors when data is invalid", %{conn: conn, vacine: vacine} do
      conn = put(conn, Routes.vacine_path(conn, :update, vacine), vacine: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Vacine"
    end
  end

  describe "delete vacine" do
    setup [:create_vacine]

    test "deletes chosen vacine", %{conn: conn, vacine: vacine} do
      conn = delete(conn, Routes.vacine_path(conn, :delete, vacine))
      assert redirected_to(conn) == Routes.vacine_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.vacine_path(conn, :show, vacine))
      end
    end
  end

  defp create_vacine(_) do
    vacine = fixture(:vacine)
    %{vacine: vacine}
  end
end
