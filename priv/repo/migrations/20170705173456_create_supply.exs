defmodule HappyTreesServer.Repo.Migrations.CreateSupply do
  use Ecto.Migration

  def change do
    create table(:supplies) do
      add :name, :string
      add :type, :string
      add :amount, :float
      add :supply_key, :string

      timestamps()
    end

  end
end
