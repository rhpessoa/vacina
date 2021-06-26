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
    |> unique_constraint(:cpf)
    |> validate_required([:nome, :cpf])
    |> validate_length(:cpf, is: 11)
  end
end
