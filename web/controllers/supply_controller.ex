defmodule HappyTreesServer.SupplyController do
  use HappyTreesServer.Web, :controller

  alias HappyTreesServer.Supply

  def index(conn, _params) do
    supplies = Repo.all(Supply)
    render(conn, "index.html", supplies: supplies)
  end

  def new(conn, _params) do
    changeset = Supply.changeset(%Supply{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"supply" => supply_params}) do
    uuid = Ecto.UUID.generate()
    {amount, _} = Float.parse(supply_params["amount"])
    changeset = Supply.changeset(%Supply{}, Map.merge(supply_params, %{"supply_key" => uuid, "amount" => amount}))

    case Repo.insert(changeset) do
      {:ok, _supply} ->
        conn
        |> put_flash(:info, "Supply created successfully.")
        |> redirect(to: supply_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    supply = Repo.get!(Supply, id)
    render(conn, "show.html", supply: supply)
  end

  def edit(conn, %{"id" => id}) do
    supply = Repo.get!(Supply, id)
    changeset = Supply.changeset(supply)
    render(conn, "edit.html", supply: supply, changeset: changeset)
  end

  def update(conn, %{"id" => id, "supply" => supply_params}) do
    supply = Repo.get!(Supply, id)
    {amount, _} = Float.parse(supply_params["amount"])
    changeset = Supply.changeset(supply, Map.merge(supply_params, %{"amount" => amount}))

    case Repo.update(changeset) do
      {:ok, supply} ->
        conn
        |> put_flash(:info, "Supply updated successfully.")
        |> redirect(to: supply_path(conn, :show, supply))
      {:error, changeset} ->
        render(conn, "edit.html", supply: supply, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    supply = Repo.get!(Supply, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(supply)

    conn
    |> put_flash(:info, "Supply deleted successfully.")
    |> redirect(to: supply_path(conn, :index))
  end
end
