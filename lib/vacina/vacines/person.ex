defmodule Vacina.Vacines.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "persons" do
    field :cpf, :string
    field :nome, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:nome, :cpf])
    |> validate_required([:nome, :cpf])
  end
end