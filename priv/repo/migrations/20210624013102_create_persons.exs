defmodule Vacina.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :nome, :string
      add :cpf, :string

      timestamps()
    end
    create unique_index(:persons, [:cpf])
  end
end
