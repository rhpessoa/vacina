defmodule Vacina.VacinationTest do
  use Vacina.DataCase

  alias Vacina.Vacination

  describe "vacines" do
    alias Vacina.Vacination.Vacine

    @valid_attrs %{descricao: "some descricao", fabricante: "some fabricante", nome: "some nome"}
    @update_attrs %{descricao: "some updated descricao", fabricante: "some updated fabricante", nome: "some updated nome"}
    @invalid_attrs %{descricao: nil, fabricante: nil, nome: nil}

    def vacine_fixture(attrs \\ %{}) do
      {:ok, vacine} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vacination.create_vacine()

      vacine
    end

    test "list_vacines/0 returns all vacines" do
      vacine = vacine_fixture()
      assert Vacination.list_vacines() == [vacine]
    end

    test "get_vacine!/1 returns the vacine with given id" do
      vacine = vacine_fixture()
      assert Vacination.get_vacine!(vacine.id) == vacine
    end

    test "create_vacine/1 with valid data creates a vacine" do
      assert {:ok, %Vacine{} = vacine} = Vacination.create_vacine(@valid_attrs)
      assert vacine.descricao == "some descricao"
      assert vacine.fabricante == "some fabricante"
      assert vacine.nome == "some nome"
    end

    test "create_vacine/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vacination.create_vacine(@invalid_attrs)
    end

    test "update_vacine/2 with valid data updates the vacine" do
      vacine = vacine_fixture()
      assert {:ok, %Vacine{} = vacine} = Vacination.update_vacine(vacine, @update_attrs)
      assert vacine.descricao == "some updated descricao"
      assert vacine.fabricante == "some updated fabricante"
      assert vacine.nome == "some updated nome"
    end

    test "update_vacine/2 with invalid data returns error changeset" do
      vacine = vacine_fixture()
      assert {:error, %Ecto.Changeset{}} = Vacination.update_vacine(vacine, @invalid_attrs)
      assert vacine == Vacination.get_vacine!(vacine.id)
    end

    test "delete_vacine/1 deletes the vacine" do
      vacine = vacine_fixture()
      assert {:ok, %Vacine{}} = Vacination.delete_vacine(vacine)
      assert_raise Ecto.NoResultsError, fn -> Vacination.get_vacine!(vacine.id) end
    end

    test "change_vacine/1 returns a vacine changeset" do
      vacine = vacine_fixture()
      assert %Ecto.Changeset{} = Vacination.change_vacine(vacine)
    end
  end
end
