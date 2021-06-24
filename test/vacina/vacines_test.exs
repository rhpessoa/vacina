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
end
