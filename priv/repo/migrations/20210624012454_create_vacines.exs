defmodule Vacina.Repo.Migrations.CreateVacines do
  use Ecto.Migration

  def change do
    create table(:vacines) do
      add :nome, :string
      add :fabricante, :string
      add :descricao, :string

      timestamps()
    end

  end
end
