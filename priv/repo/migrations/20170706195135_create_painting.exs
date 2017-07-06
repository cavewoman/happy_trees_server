defmodule HappyTreesServer.Repo.Migrations.CreatePainting do
  use Ecto.Migration

  def change do
    create table(:paintings) do
      add :title, :string
      add :date_painted, :utc_datetime
      add :painting_key, :string

      timestamps()
    end

    create index(:paintings, [:painting_key])
  end
end
