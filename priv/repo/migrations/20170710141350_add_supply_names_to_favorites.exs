defmodule HappyTreesServer.Repo.Migrations.AddSupplyNamesToFavorites do
  use Ecto.Migration

  def change do
    alter table(:favorites) do
      add :supply_names, {:array, :string}
    end
  end
end
