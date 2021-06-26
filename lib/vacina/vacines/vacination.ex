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
    |> cast(attrs, [:lote, :data, :aplicador, :vacinado, :vacine])
    |> validate_required([:lote, :data, :aplicador, :vacine])
    |> validate_change(:data, &validate_date(&1, &2))

    # |> foreign_key_constraint(:vacinado)
  end

  def validate_date(_type, data) do
    today = Date.utc_today()
    date_diff = Date.diff(today, data)

    if date_diff >= 43800 || date_diff < 0 do
      [data: "data inválida"]
    else
      []
    end
  end
end
