defmodule Vacina.Repo.Migrations.CreateVacinations do
  use Ecto.Migration

  def change do
    create table(:vacinations) do
      add :lote, :string
      add :data, :date
      add :aplicador, :string
      add :vacinado, references(:persons, on_delete: :nothing)
      add :vacine, references(:vacines, on_delete: :nothing)

      timestamps()
    end

    create index(:vacinations, [:vacinado])
    create index(:vacinations, [:vacine])
  end
end
