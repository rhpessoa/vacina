defmodule Vacina.VacinesTest do
  use Vacina.DataCase

  alias Vacina.Vacines

  describe "persons" do
    alias Vacina.Vacines.Person

    @valid_attrs %{cpf: "some cpf", nome: "some nome"}
    @update_attrs %{cpf: "some updated cpf", nome: "some updated nome"}
    @invalid_attrs %{cpf: nil, nome: nil}

    def person_fixture(attrs \\ %{}) do
      {:ok, person} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vacines.create_person()

      person
    end

    test "list_persons/0 returns all persons" do
      person = person_fixture()
      assert Vacines.list_persons() == [person]
    end

    test "get_person!/1 returns the person with given id" do
      person = person_fixture()
      assert Vacines.get_person!(person.id) == person
    end

    test "create_person/1 with valid data creates a person" do
      assert {:ok, %Person{} = person} = Vacines.create_person(@valid_attrs)
      assert person.cpf == "some cpf"
      assert person.nome == "some nome"
    end

    test "create_person/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vacines.create_person(@invalid_attrs)
    end

    test "update_person/2 with valid data updates the person" do
      person = person_fixture()
      assert {:ok, %Person{} = person} = Vacines.update_person(person, @update_attrs)
      assert person.cpf == "some updated cpf"
      assert person.nome == "some updated nome"
    end

    test "update_person/2 with invalid data returns error changeset" do
      person = person_fixture()
      assert {:error, %Ecto.Changeset{}} = Vacines.update_person(person, @invalid_attrs)
      assert person == Vacines.get_person!(person.id)
    end

    test "delete_person/1 deletes the person" do
      person = person_fixture()
      assert {:ok, %Person{}} = Vacines.delete_person(person)
      assert_raise Ecto.NoResultsError, fn -> Vacines.get_person!(person.id) end
    end

    test "change_person/1 returns a person changeset" do
      person = person_fixture()
      assert %Ecto.Changeset{} = Vacines.change_person(person)
    end
  end

  describe "vacinations" do
    alias Vacina.Vacines.Vacination

    @valid_attrs %{aplicador: "some aplicador", data: ~D[2010-04-17], lote: "some lote"}
    @update_attrs %{aplicador: "some updated aplicador", data: ~D[2011-05-18], lote: "some updated lote"}
    @invalid_attrs %{aplicador: nil, data: nil, lote: nil}

    def vacination_fixture(attrs \\ %{}) do
      {:ok, vacination} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Vacines.create_vacination()

      vacination
    end

    test "list_vacinations/0 returns all vacinations" do
      vacination = vacination_fixture()
      assert Vacines.list_vacinations() == [vacination]
    end

    test "get_vacination!/1 returns the vacination with given id" do
      vacination = vacination_fixture()
      assert Vacines.get_vacination!(vacination.id) == vacination
    end

    test "create_vacination/1 with valid data creates a vacination" do
      assert {:ok, %Vacination{} = vacination} = Vacines.create_vacination(@valid_attrs)
      assert vacination.aplicador == "some aplicador"
      assert vacination.data == ~D[2010-04-17]
      assert vacination.lote == "some lote"
    end

    test "create_vacination/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Vacines.create_vacination(@invalid_attrs)
    end

    test "update_vacination/2 with valid data updates the vacination" do
      vacination = vacination_fixture()
      assert {:ok, %Vacination{} = vacination} = Vacines.update_vacination(vacination, @update_attrs)
      assert vacination.aplicador == "some updated aplicador"
      assert vacination.data == ~D[2011-05-18]
      assert vacination.lote == "some updated lote"
    end

    test "update_vacination/2 with invalid data returns error changeset" do
      vacination = vacination_fixture()
      assert {:error, %Ecto.Changeset{}} = Vacines.update_vacination(vacination, @invalid_attrs)
      assert vacination == Vacines.get_vacination!(vacination.id)
    end

    test "delete_vacination/1 deletes the vacination" do
      vacination = vacination_fixture()
      assert {:ok, %Vacination{}} = Vacines.delete_vacination(vacination)
      assert_raise Ecto.NoResultsError, fn -> Vacines.get_vacination!(vacination.id) end
    end

    test "change_vacination/1 returns a vacination changeset" do
      vacination = vacination_fixture()
      assert %Ecto.Changeset{} = Vacines.change_vacination(vacination)
    end
  end
end
