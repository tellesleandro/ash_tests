defmodule Core.Repo.Migrations.CreateTable1 do
  use Ecto.Migration

  def change do
    create table(:table_1, primary_key: false) do
      add :id, :uuid, primary_key: true
      timestamps()
      add :field_1, :timestamptz, null: false
    end
  end
end
