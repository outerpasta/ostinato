defmodule Ostinato.Suite do
  use Ostinato.Web, :model

  schema "suites" do
    field :name, :string
    field :notes, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :notes])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
