defmodule Vacina.Vacines.Vacination do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vacinations" do
    field :aplicador, :string
    field :data, :date
    field :lote, :string
    field :vacinado, :id
    field :vacine, :id

    timestamps()
  end

  @doc false
  def changeset(vacination, attrs) do
    vacination
    |> cast(attrs, [:lote, :data, :aplicador])
    |> validate_required([:lote, :data, :aplicador])
  end
end
