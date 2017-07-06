defmodule HappyTreesServer.Repo.Migrations.CreateFavorite do
  use Ecto.Migration

  def change do
    create table(:favorites) do
      add :title, :string
      add :url, :string
      add :favorite_key, :string

      timestamps()
    end

    create index(:favorites, [:favorite_key])
  end
end
