defmodule Ostinato.Repo.Migrations.CreateSuite do
  use Ecto.Migration

  def change do
    create table(:suites) do
      add :name, :string
      add :notes, :string

      timestamps()
    end
    create unique_index(:suites, [:name])

  end
end
