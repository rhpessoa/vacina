defmodule VacinaWeb.VacinationControllerTest do
  use VacinaWeb.ConnCase

  alias Vacina.Vacines

  @create_attrs %{aplicador: "some aplicador", data: ~D[2010-04-17], lote: "some lote"}
  @update_attrs %{aplicador: "some updated aplicador", data: ~D[2011-05-18], lote: "some updated lote"}
  @invalid_attrs %{aplicador: nil, data: nil, lote: nil}

  def fixture(:vacination) do
    {:ok, vacination} = Vacines.create_vacination(@create_attrs)
    vacination
  end

  describe "index" do
    test "lists all vacinations", %{conn: conn} do
      conn = get(conn, Routes.vacination_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Vacinations"
    end
  end

  describe "new vacination" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.vacination_path(conn, :new))
      assert html_response(conn, 200) =~ "New Vacination"
    end
  end

  describe "create vacination" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.vacination_path(conn, :create), vacination: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.vacination_path(conn, :show, id)

      conn = get(conn, Routes.vacination_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Vacination"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.vacination_path(conn, :create), vacination: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Vacination"
    end
  end

  describe "edit vacination" do
    setup [:create_vacination]

    test "renders form for editing chosen vacination", %{conn: conn, vacination: vacination} do
      conn = get(conn, Routes.vacination_path(conn, :edit, vacination))
      assert html_response(conn, 200) =~ "Edit Vacination"
    end
  end

  describe "update vacination" do
    setup [:create_vacination]

    test "redirects when data is valid", %{conn: conn, vacination: vacination} do
      conn = put(conn, Routes.vacination_path(conn, :update, vacination), vacination: @update_attrs)
      assert redirected_to(conn) == Routes.vacination_path(conn, :show, vacination)

      conn = get(conn, Routes.vacination_path(conn, :show, vacination))
      assert html_response(conn, 200) =~ "some updated aplicador"
    end

    test "renders errors when data is invalid", %{conn: conn, vacination: vacination} do
      conn = put(conn, Routes.vacination_path(conn, :update, vacination), vacination: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Vacination"
    end
  end

  describe "delete vacination" do
    setup [:create_vacination]

    test "deletes chosen vacination", %{conn: conn, vacination: vacination} do
      conn = delete(conn, Routes.vacination_path(conn, :delete, vacination))
      assert redirected_to(conn) == Routes.vacination_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.vacination_path(conn, :show, vacination))
      end
    end
  end

  defp create_vacination(_) do
    vacination = fixture(:vacination)
    %{vacination: vacination}
  end
end
