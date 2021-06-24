defmodule Vacina.Vacination.Vacine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vacines" do
    field :descricao, :string
    field :fabricante, :string
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(vacine, attrs) do
    vacine
    |> cast(attrs, [:nome, :fabricante, :descricao])
    |> validate_required([:nome, :fabricante, :descricao])
  end
end
