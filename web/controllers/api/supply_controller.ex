defmodule HappyTreesServer.API.SupplyController do
  use HappyTreesServer.Web, :controller

  alias HappyTreesServer.Supply

  def index(conn, _params) do
    supplies = Repo.all(Supply)
    json conn, supplies
  end

  def update(conn, %{"supplies" => supplies}) do
    {status, supplies} = update_or_create_supplies(supplies, {:ok, []})
    json conn, %{status: status, supplies: supplies}
  end

  def update_or_create_supplies(_, {:error, message}), do: {:error, message}
  def update_or_create_supplies([], status), do: status
  def update_or_create_supplies([head| tail], {_, supplies}) do
    supply = Repo.get_by(Supply, supply_key: head["supply_key"])

    if (supply) do
      {update_status, updated_supply} = update_supply(supply, head)
      update_or_create_supplies(tail, {update_status, [updated_supply | supplies]})
    else
      {create_status, created_supply} = create_supply(head)
      update_or_create_supplies(tail, {create_status, [created_supply | supplies]})
    end
  end

  def update_supply(supply, supply_params) do
    changeset = Supply.changeset(supply, supply_params)
    Repo.update(changeset)
  end

  def create_supply(supply_params) do
    changeset = Supply.changeset(%Supply{}, supply_params)
    Repo.insert(changeset)
  end
end
